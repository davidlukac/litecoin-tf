terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.46.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.3.2"
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

// Simplest solution for the PoC - using local Docker Desktop Kubernetes. Normally this would be e.g. authentication via
// a services account token for the terraform provisioner service account.
provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "docker-desktop"
}
