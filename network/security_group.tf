resource "aws_security_group" "msk_access" {
    name        = "msk_access_sg"
    description = "Security group for Lambda to access MSK"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        from_port   = 9092
        to_port     = 9092
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 9092
        to_port     = 9092
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "msk_access_sg"
    }
}
