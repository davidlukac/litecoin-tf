module "aws-ecr" {
  repositories = var.aws-ecr-repositories

  source = "../../modules/aws-ecr"
}
