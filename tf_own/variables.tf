variable "env" {
  type        = string
  description = "Please give the value for the environment "
  default     = "dev"
}
variable "region" {
  type        = string
  default     = "us-east-2"
  description = "The region you want to select"

}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR"
}

