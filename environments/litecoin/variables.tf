// Auto-loaded AWS credentials and other sensitive variables.
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_ACCOUNT_ID" {}

variable "environment" {
  default = "litecoin"
}

variable "aws-region" {
  default = "eu-central-1"
}
