resource "aws_cloudwatch_log_group" "logs" {
    name              = "log-group"
    retention_in_days = 7
}
