variable "region" {
    type = list(string)
    default = [ "us-east-1","us-east-2","us-east-3" ]
  
}
variable "num" {
    type = set(number)
    default = [ 250,10,11,5 ]
    description = "A set of number"
  
}
variable "num1" {
    type = number
    default = 10.1
}
variable "ami" {
    type = string
    default = "ami-xyz,AMI-ABC,ami-efg"
    description = "string containing ami"
  
}
variable "map-ami" {
    type = map(string)
    default = {
      "us-east-1" = "ami-xyz",
      "us-east-2" = "ami-xyz2"
          }
}
variable "special" {
    type = bool
    default = false
    description = "for testing"
  
}
variable "num3" {
    type   = number
    default = 25
  
}