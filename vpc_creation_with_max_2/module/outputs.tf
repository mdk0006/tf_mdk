output "no_of_available_az" {
  value = [for i in data.aws_availability_zones.available.names : i]

}
output "pri-subnet-names-with-cidr" {
  value = { for i in aws_subnet.private_subnet : i.tags.Name => i.cidr_block }
}
output "pub-subnet-names-with-cidr" {
  value = { for i in aws_subnet.public_subnet : i.tags.Name => i.cidr_block }
}
output "region" {
  value = var.region

}
# output "private_cidrs" {
#   value = { for i in aws_subnet.private_subnet : i.id => i.cidr_block }

# }
# output "public_cidrs" {
#   value = { for i in aws_subnet.public_subnet : i.id => i.cidr_block }
# }
output "vpc_id" {
  value = aws_vpc.my_vpc.id
  
}