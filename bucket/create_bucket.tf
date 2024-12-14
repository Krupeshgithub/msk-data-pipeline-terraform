resource "aws_s3_bucket" "msk_bucket" {
    bucket = "msk-bucket-learning"
}

resource "aws_s3_object" "push_object" {
    bucket = aws_s3_bucket.msk_bucket.id
    key    = "msk-object.json"
    source = "../output.json"
}

resource "aws_s3_bucket_public_access_block" "msk_bucket_public_access_block" {
  bucket = aws_s3_bucket.msk_bucket.id

  # Allow public access through new ACLs
  block_public_acls       = false
  block_public_policy     = false

  # Allow public access through any ACLs
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "msk_bucket_policy" {
    bucket = aws_s3_bucket.msk_bucket.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "PublicReadSpecificObject"
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = "arn:aws:s3:::msk-bucket-learning/msk-object.json"
            }
        ]
    })
}
