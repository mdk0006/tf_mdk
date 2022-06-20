output "vpc_name" {
  value = aws_vpc.my_vpc.tags.Name
}
output "vpc_id" {
  value = aws_vpc.my_vpc.id

}
output "vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block

}
output "private_cidrs" {
  value = aws_subnet.pri_subnet[*].cidr_block

}
output "public_cidrs" {
  value = aws_subnet.public_subnet[*].cidr_block
}
output "region" {
  value = var.region

}

output "pri-subnet-names" {
  value = { for i in aws_subnet.pri_subnet : i.id => i.availability_zone }
}
output "pub-subnet-names" {
  value = { for i in aws_subnet.public_subnet : i.id => i.availability_zone }
}