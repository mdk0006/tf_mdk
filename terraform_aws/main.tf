
# resource "aws_instance" "ec2" {
#   ami                         = data.aws_ami.server_ami.id
#   vpc_security_group_ids      = [aws_security_group.sg1.id]
#   key_name                    = aws_key_pair.my-key.id
#   associate_public_ip_address = true
#   instance_type               = var.ec2_type
#   root_block_device {
#     volume_size = 10
#   }
#   tags = {
#     "env"  = "tf"
#     "Name" = "tf-machine"
#   }

# }
# resource "aws_key_pair" "my-key" {
#   key_name   = "for-tf"
#   public_key = file("~/.ssh/id_rsa.pub")
# }