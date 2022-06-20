resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}-vpc"
    TF   = "True"
  }

}
resource "aws_subnet" "public_subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + 1)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}
resource "aws_subnet" "pri_subnet" {
  count             = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 8)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }

}
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "${aws_vpc.my_vpc.tags.Name}-igw"
    "TF"   = "True"
  }

}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "${aws_vpc.my_vpc.tags.Name}-Pub-RT"
  }
}

resource "aws_route" "pub_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id

}
# Associations for the route tables
resource "aws_route_table_association" "a" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}