variable "aws-ecr-repositories" {
  type = set(string)

  default = [
    "litecoin",
    "litecoin-tf"
  ]
}
