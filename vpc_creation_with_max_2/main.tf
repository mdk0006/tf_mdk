module "my_module" {
  source     = "./module/"
  region     = "us-east-2"
  env        = "prod"
  vpc_cidr   = "172.16.0.0/16"
  pri_subnet = 2
  pub_subnet = 3
}
output "az_available" {
  value = module.my_module.no_of_available_az

}
output "private_cidrs" {
  value = module.my_module.pri-subnet-names-with-cidr
}
output "public_cidrs" {
  value = module.my_module.pub-subnet-names-with-cidr
}
resource "aws_security_group" "sg1" {

  vpc_id = module.my_module.vpc_id
  tags = {
    Name = "for_prac"
  }
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.sg1.id
  cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "from_my_ip" {
  type = "ingress"
  to_port = 65555
  from_port = 0
  protocol = tcp
  cidr_blocks = ["202.163.113.168/32"]
  security_group_id = aws_security_group.sg1.id
}


# }
output "sg-name" {
  value = aws_security_group.sg1.tags.Name

}
