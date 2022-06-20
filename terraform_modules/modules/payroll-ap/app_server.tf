resource "aws_instance" "app_server" {
    ami = data.aws_ami.server_ami.id
    instance_type = "t2.micro"
    tags = {
      "Name" = "${var.app_region}-app-server"
    }
    depends_on = [ aws_s3_bucket.payroll_data ,aws_dynamodb_table.payroll_db ]  
    
}
data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"]
  }
}