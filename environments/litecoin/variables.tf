// Auto-loaded AWS credentials and other sensitive variables.
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_ACCOUNT_ID" {}

variable "environment" {
  default = "litecoin"
}

variable "aws-ecr-repositories" {
  type = set(string)

  default = [
    "litecoin",
    "litecoin-tf"
  ]
}

variable "aws-technical-users" {
  type = set(string)

  default = [
    "ci",
    "terraform",
  ]
}

variable "aws-technical-groups" {
  type = set(string)

  default = [
    "ci",
    "provisioner"
  ]
}

variable "aws-technical-group-membership" {
  default = {
    "ci": ["ci"]
    "terraform": ["provisioner"]
  }
}

variable "aws-technical-group-policy" {
  default = {
    "ci": ["ECRWriteImages"]
    // This is very wide access, a custom policy should be create for provisioners like Terraform, but serves a purpose
    // for now.
    "provisioner": ["AdministratorAccess"]
  }
}
