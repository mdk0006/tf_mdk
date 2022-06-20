output "ami_id" {
  value = data.aws_ami.server_ami.id
}
output "default_vpc_id" {
  value = data.aws_vpc.vpc_id.id

}
# output "ip" {
#   value = aws_instance.ec2.public_ip
# }
output "az" {
  value = data.aws_availability_zones.available.names

}
output "access_key" {
  value = aws_iam_access_key.lb.id
}
output "secret_key" {
  value     = aws_iam_access_key.lb.secret
  sensitive = true
}

output "aws_s3" {
  value = aws_s3_bucket.random_s3.id
}
# output "admin_group" {
#   value = data.aws_iam_group.admin_group.arn

# }