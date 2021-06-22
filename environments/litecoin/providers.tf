terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.46.0"
    }
  }
}

provider "aws" {
  region = var.aws-region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY

  default_tags {
    tags = {
      provisioner = "terraform"
      environment = var.environment
      owner = "david.lukac"
    }
  }
}

