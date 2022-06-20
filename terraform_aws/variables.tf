# variable "access_key" {
#   description = "For AWS access key"
# }

# variable "secret_key" {
#   description = "For AWS secret key"
# }

variable "region" {
  description = "For selecting the region of AWS"
}
variable "ec2_type" {
  description = "To give the ec2 instance type"
  default     = "t2.micro"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "pub_subnet" {
  default = ["10.0.1.0/24", "10.0.3.0/24"]


}
variable "env" {
  default = "tf"
}