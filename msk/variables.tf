variable "subnets" {
  description = "List of subnet IDs for the MSK cluster"
  type        = list(string)
}

variable "security_groups" {
    description = "List of security group IDs for the MSK cluster"
    type        = list(string)
}

variable "cloudwatch" {
    description = "Enable CloudWatch logging for MSK cluster"
    type        = string
}
