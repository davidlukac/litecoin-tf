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
