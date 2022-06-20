terraform {
  required_version = "~>1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.17.0"
    }
  }
  backend "s3" {
    region         = "us-east-2"
    bucket         = "terraform-dani-state-locking"
    dynamodb_table = "state-locking"
    key            = "dani/terraform.tfstate"

  }
}
provider "aws" {
  profile = "default"
}