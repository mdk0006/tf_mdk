variable "pri_subnet" {
  description = "Enter the number of private subnets"
 # default     = 2
}
variable "pub_subnet" {
  description = "Enter the number of public subnets"
 # default     = 2
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "env" {
  default = "dev"
}
variable "region" {
    description = "aws region"
  #  default = "us-east-2"
  
}