locals {
  policies = {
    ECRWriteImages = {
      name = "ECRWriteImages"
      description = "Policy for writing images into the ECR without the admin permissions."
      policy = file("${path.module}/policy/ECRWriteImages.json")
    }
  }
}

resource "aws_iam_policy" "policy" {
  for_each = local.policies

  name = each.value.name
  description = each.value.description
  policy = each.value.policy
}
