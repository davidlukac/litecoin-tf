resource "aws_iam_role" "role" {
  for_each = var.iam-entities

  name = var.with_suffix ? "${var.environment}-${each.value}-role" : "${var.environment}-${each.value}"
  path = "/default/${var.environment}/${each.value}/"
  assume_role_policy = templatefile("${path.module}/policy/default-assume.json",
    {
      account-id = var.account-id
    }
  )
}

resource "aws_iam_policy" "policy" {
  for_each = var.iam-entities

  name = var.with_suffix ? "${var.environment}-${each.value}-policy" : "${var.environment}-${each.value}"
  path = "/default/${var.environment}/${each.value}/"
  policy = templatefile("${path.module}/policy/assume.json",
    {
      account-id = var.account-id,
      role = aws_iam_role.role[each.value].name
    }
  )
}

resource "aws_iam_group" "group" {
  for_each = var.iam-entities

  name = var.with_suffix ? "${var.environment}-${each.value}-group" : "${var.environment}-${each.value}"
  path = "/default/${var.environment}/${each.value}/"
}

resource "aws_iam_group_policy_attachment" "group-policy" {
  for_each = var.iam-entities

  group = aws_iam_group.group[each.value].name
  policy_arn = aws_iam_policy.policy[each.value].arn
}

resource "aws_iam_user" "user" {
  for_each = var.iam-entities

  name = var.with_suffix ? "${var.environment}-${each.value}-policy" : "${var.environment}-${each.value}"
  path = "/default/${var.environment}/${each.value}/"
}

resource "aws_iam_user_group_membership" "user-group-member" {
  for_each = var.iam-entities

  user = aws_iam_user.user[each.value].name
  groups = [aws_iam_group.group[each.value].name]
}

