resource "aws_cloudwatch_log_group" "lambda_log_group" {
    name             = "/aws/lambda/msk-topic-lambda"
    retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "msk_consumer_log_group" {
    name              = "/aws/lambda/msk-consumer-lambda"
    retention_in_days = 7
}
