# output "public_ip" {
#   value = aws_instance.ec2.public_ip
# }
output "repo_url" {
value = [for i in aws_ecr_repository.ecrs: i.repository_url]
}