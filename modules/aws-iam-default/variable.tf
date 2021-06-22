// Environment/context - will be used to prefix all entities.
variable "environment" {
  type = string
}

// AWS account ID needed for correct policy setup.
variable "account-id" {
  type = string
}

// List of names for unified IAM entities creation - role, group, policy, user.
variable "iam-entities" {
  type = set(string)
}

// Toggle the entity name suffix.
variable "with_suffix" {
  type = bool
  default = false
}
