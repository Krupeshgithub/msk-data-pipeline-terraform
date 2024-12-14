# Create subnets for the project

# public subnet
resource "aws_subnet" "subnet1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.0.0/20"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "subnet1-us-east-1a"
    }
}

# public subnet
resource "aws_subnet" "subnet3" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.48.0/20"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "subnet3-us-east-1b"
    }
}

# private subnet
resource "aws_subnet" "subnet2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.80.0/20"
    availability_zone       = "us-east-1b"

    tags = {
        Name = "subnet2-us-east-1b"
    }
}

# private subnet
resource "aws_subnet" "subnet4" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.96.0/20"
    availability_zone       = "us-east-1a"

    tags = {
        Name = "subnet4-us-east-1a"
    }
}
