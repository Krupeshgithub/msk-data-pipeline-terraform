# Lambda execution role
resource "aws_iam_role" "lambda_exec" {
  name               = "lambda-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# For lambda to fetch the MSK cluster details
resource "aws_iam_role_policy" "msk_policy" {
  name   = "msk-policy"
  role   = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "kafka:DescribeCluster",
          "kafka:ListTopics",
          "kafka:DescribeTopic",
          "kafka:GetBootstrapBrokers",
          "kafka:Connect"
        ]
        Resource = "*"
      },
    ]
  })
}

# For lambda to fetch s3 bucket object
resource "aws_iam_role_policy" "s3_policy" {
  name   = "s3-policy"
  role   = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      },
    ]
  })
}
