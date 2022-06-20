resource "aws_security_group" "sg1" {
  description = "AWS SG"
  name        = "sg for prac"
  vpc_id      = data.aws_vpc.vpc_id.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["202.163.113.168/32", "54.225.178.237/32"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    ignore_changes  = all
    prevent_destroy = true

  }
}

# resource "aws_vpc" "vpc" {

#   cidr_block           = var.cidr_block
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   tags = {
#     "Name" = "${var.env}-vpc"
#   }

# }
# resource "aws_subnet" "pub_subnets" {
#   vpc_id                  = aws_vpc.vpc.id
#   map_public_ip_on_launch = true
#   for_each                = toset(data.aws_availability_zones.available.names)
#   availability_zone       = each.value
#   cidr_block              = cidrsubnet(var.cidr_block, 8, 3)
#   tags = {
#     Name = "${var.env}-pri-subnet"
#   }
# }
# resource "aws_subnet" "pri_subnets" {
#   vpc_id                  = aws_vpc.vpc.id
#   map_public_ip_on_launch = true
#   for_each                = toset(data.aws_availability_zones.available.names)
#   availability_zone       = each.value
#   cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
#   tags = {
#     Name = "${var.env}-pri-subnet"
#   }
# }
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     "Name" = "${var.env}-igw"
#   }

# }