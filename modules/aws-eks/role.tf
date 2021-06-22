resource "aws_iam_role" "AWSServiceRoleForAmazonEKS" {
  name = "AWSServiceRoleForAmazonEKS"
  description = "Allows EKS to manage clusters on your behalf."
  path = "/aws-service-role/eks.amazonaws.com/"

  assume_role_policy = file("${path.module}/policy/AssumeEksRole.json")
}

resource "aws_iam_role" "EKSClusterRole" {
  name = "EKSClusterRole"
  description = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  path = "/"

  assume_role_policy = file("${path.module}/policy/AssumeEksRole.json")
}
