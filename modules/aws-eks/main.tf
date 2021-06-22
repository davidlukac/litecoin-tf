resource "aws_eks_cluster" "cluster" {
  name = var.name
  role_arn = aws_iam_role.EKSClusterRole.arn

  vpc_config {
    subnet_ids = [
      aws_default_subnet.default-a.id,
      aws_default_subnet.default-b.id,
      aws_default_subnet.default-c.id,
      ]

    security_group_ids = [
      aws_default_security_group.default.id
    ]
  }
}
