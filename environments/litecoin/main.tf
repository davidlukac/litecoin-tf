module "aws-iam" {
  users = var.aws-technical-users
  groups = var.aws-technical-groups
  group-memberships = var.aws-technical-group-membership
  group-policies = var.aws-technical-group-policy

  source = "../../modules/aws-iam-technical"
}

module "aws-ecr" {
  repositories = var.aws-ecr-repositories

  source = "../../modules/aws-ecr"
}
