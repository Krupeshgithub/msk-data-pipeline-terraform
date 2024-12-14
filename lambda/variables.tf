variable "iam" {
    description = "IAM role for Lambda"
    type        = string
}

variable "cluster_arn" {
    description = "ARN of the MSK cluster"
    type        = string
}

variable "bucket_name" {
    description = "Name of the S3 bucket"
    type        = string
}

variable "bootstrap_brokers" {
    description = "TLS connection host:port pairs"
    type        = string
}
