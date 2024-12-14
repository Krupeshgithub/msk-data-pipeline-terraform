# Created two route tables, one for public and one for private

# Public route table
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"    # All traffic
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public-route-table"
    }
}

# With two associations, one for each public subnet
resource "aws_route_table_association" "public_association" {
    subnet_id      = aws_subnet.subnet1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_association2" {
    subnet_id      = aws_subnet.subnet3.id
    route_table_id = aws_route_table.public.id
}

# Private route table
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "private-route-table"
    }
}

# With two associations, one for each private subnet
resource "aws_route_table_association" "private_association" {
    subnet_id      = aws_subnet.subnet2.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_association2" {
    subnet_id      = aws_subnet.subnet4.id
    route_table_id = aws_route_table.private.id
}
