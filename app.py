"""This module fetch the data from MSK topic and show into the frontend."""
import os
import boto3

from kafka import KafkaConsumer

BOOTSTRAP_SERVER = os.getenv("BOOTSTRAP_SERVER")
TOPIC_NAME = os.getenv("TOPIC_NAME")


def main():
    consumer = KafkaConsumer(
        TOPIC_NAME,
        bootstrap_servers=BOOTSTRAP_SERVER,
        auto_offset_reset="latest",
        enable_auto_commit=True,
        value_deserializer=lambda x: x.decode("utf-8")
    )

    # Poll and print messages
    try:
        for message in consumer:
            print(f"Received message: {message.value.decode('utf-8')}")
    except KeyboardInterrupt:
        print("Consumer interrupted")
    finally:
        consumer.close()


if __name__ == "__main__":
    main()
