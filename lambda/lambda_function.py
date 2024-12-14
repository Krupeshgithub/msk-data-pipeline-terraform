from kafka.admin import KafkaAdminClient, NewTopic
from kafka import KafkaProducer
import boto3
import os
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    """Create the topic into the MSK Cluster.
    :event: The event data from the Terraform.
    :context: The context data from the Terraform.
    """
    bootstrap_servers = os.environ.get("BOOTSTRAP_SERVERS")
    topic_name = event["topic_name"]

    # Create the Kafka topic using kafka-python
    try:
        admin_client = KafkaAdminClient(
            bootstrap_servers=bootstrap_servers,
            client_id='lambda-kafka-admin'
        )
        topic = NewTopic(
            name=topic_name,
            num_partitions=2
        )
        admin_client.create_topics([topic])
        logger.info(f"MSK topic {topic_name} created successfully.")
    except Exception as e:
        logger.error(f"Error creating topic: {e}")
        return {"message": "Topic creation failed."}

    # Fetch the object from the S3 bucket and push the data into the MSK topic
    s3_client = boto3.client("s3")
    bucket_name = os.environ.get("BUCKET_NAME")
    object_key = event["object_key"]

    try:
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        object_data = response["Body"].read().decode("utf-8")

        # Push data to Kafka topic
        producer = KafkaProducer(bootstrap_servers=bootstrap_servers)
        for line in object_data.splitlines():
            producer.send(topic_name, line.encode('utf-8'))

        producer.flush()
        logger.info("Data pushed to Kafka topic successfully.")
        return {"message": "Data pushed successfully."}
    except Exception as e:
        logger.error(f"Error: {e}")
        return {"message": "Data not pushed into the MSK topic."}
