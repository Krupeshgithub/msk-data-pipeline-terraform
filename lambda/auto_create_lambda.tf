# Create lambda function
resource "aws_lambda_function" "msk_lambda" {
    function_name = "msk-creation-lambda"
    runtime       = "python3.11"
    description   = "Lambda function to create the MSK topic and push the data to S3"
    handler       = "lambda_function.lambda_handler"
    role          = var.iam
    filename      = "lambda/lambda_function.zip"
    layers        = [aws_lambda_layer_version.msk_layer.arn]
    source_code_hash = filebase64sha256("lambda/lambda_function.zip")
    environment {
        variables = {
            CLUSTER_ARN = var.cluster_arn
            BUCKET_NAME = var.bucket_name
            BOOTSTRAP_BROKERS = var.bootstrap_brokers
        }
    }
}

# Create lambda layer
resource "aws_lambda_layer_version" "msk_layer" {
    layer_name          = "msk-layer"
    compatible_runtimes = ["python3.11"]
    description         = "Layer for MSK dependencies"
    filename            = "kafka_layer.zip"
    source_code_hash    = filebase64sha256("kafka_layer.zip")
}
