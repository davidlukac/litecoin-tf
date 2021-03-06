resource "aws_ecr_repository" "repository" {
  for_each = var.repositories

  name = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
