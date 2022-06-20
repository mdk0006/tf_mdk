variable "app_region" {
    type = string
  
}
variable "bucket" {
    default = "flexit-dani-pay-roll"
  
}
# variable "ami" {
#     type = string
#     default = data.aws_ami.server_ami.id
# }