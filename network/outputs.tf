# Terrafor output file
output "vpc_id" {
    description = "The ID of the VPC"
    value = aws_vpc.vpc.id
}
output "subnet_ids" {
    description = "The IDs of the subnets"
    value = [
        aws_subnet.subnet1.id,
        aws_subnet.subnet2.id,
        aws_subnet.subnet3.id,
        aws_subnet.subnet4.id,
    ]
}

output "security_group_id" {
    description = "The ID of the security group"
    value = aws_security_group.msk_access.id
}

output "subnet_msk" {
    description = "This IDs of the subnets for the MSK cluster"
    value = [
        aws_subnet.subnet1.id,
        aws_subnet.subnet2.id
    ]
}
