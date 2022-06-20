terraform {
  required_version = "~>1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.18.0"

    }
  }
}
# We have done this to make sure the terraform will run the required provider and its own version
provider "aws" {
  region = var.region

}