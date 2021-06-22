module "aws-iam" {
  users = var.aws-technical-users
  groups = var.aws-technical-groups
  group-memberships = var.aws-technical-group-membership
  group-policies = var.aws-technical-group-policy

  source = "../../modules/aws-iam-technical"
}

module "aws-iam-default" {
  environment = var.environment
  account-id = var.AWS_ACCOUNT_ID
  iam-entities = var.default-iam-entities

  source = "../../modules/aws-iam-default"
}

module "aws-iam-default-with-suffix" {
  environment = var.environment
  account-id = var.AWS_ACCOUNT_ID
  iam-entities = var.default-iam-entities
  with_suffix = true

  source = "../../modules/aws-iam-default"
}

module "aws-ecr" {
  repositories = var.aws-ecr-repositories

  source = "../../modules/aws-ecr"
}

module "aws-eks-cluster" {
  name = var.cluster-name
  region = var.aws-region

  source = "../../modules/aws-eks"
}

module "k8s-resources" {
  namespaces = var.k8s-namespaces
  data-root = var.LITECOIN_DATA_ROOT

  source = "../../modules/k8s-resources"
}
