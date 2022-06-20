# resource "aws_instance" "ec2" {
#   ami                         = data.aws_ami.server_ami.id
#   key_name                    = aws_key_pair.key_tf.id
#   instance_type               = "t2.micro"
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.sg1.id]
#   #user_data                   = file("tmp.tpl")
#   # Using remote provisioner to install nginx
#   provisioner "remote-exec" {
#     on_failure = continue
#     inline = [
#       "sudo apt update -y",
#       "sudo apt install nginxy -y",
#       "sudo systemctl enable nginx",
#       "sudo systemctl start nginx",
#     ]
#     #Have to give the connection parameters 
#     connection {
#       type        = "ssh"
#       host        = self.public_ip # because we are using the provisioner inside the resource block
#       user        = "ubuntu"
#       private_key = file("/home/ubuntu/.ssh/id_rsa")
#     }

#   }
#   tags = {
#     Name        = "tf-machine"
#     Description = "An NGINX Machine "
#     Environment = "Production"
#   }
#   lifecycle {
#     ignore_changes = [tags]
#   }
#   # simple example of provisioner to get the ip on the loacl machine 
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.ec2.public_ip} Created! > /home/ubuntu/environment/terraform_state/state_of_ec2.txt"

#   }
#   # this will work on destroy event
#   provisioner "local-exec" {
#     when    = destroy
#     command = "echo ${self.public_ip}  Destriyed! > /home/ubuntu/environment/terraform_state/status"

#   }
#   # it will fail but continue
#   provisioner "local-exec" {
#     on_failure = continue
#     command    = "echo ${self.public_ip} > /temp/dani.txt"

#   }

# }

# resource "aws_key_pair" "key_tf" {
#   key_name   = "for-tf"
#   public_key = file("~/.ssh/id_rsa.pub")

# }
# resource "aws_security_group" "sg1" {
#   description = "AWS SG"
#   name        = "sg for state"
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["202.163.113.168/32", "54.225.178.237/32"]

#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


# }
# data "aws_ami" "server_ami" {
#   most_recent = true
#   owners      = ["099720109477"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"]
#   }
# }

resource "aws_ecr_repository" "ecrs" {
  for_each = var.ecr_name
  name     = each.value
  tags = {
    "Environment" = "Dev"
    "Created_By"  = "Danish"
  }
  provisioner "local-exec" {
    on_failure = continue
    command    = "echo ${self.name} repos created > ./repo.txt"

   
    
  }
  }