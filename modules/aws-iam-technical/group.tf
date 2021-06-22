resource "aws_iam_group" "group" {
  for_each = var.groups

  name = each.value
}

resource "aws_iam_user_group_membership" "membership" {
  for_each = var.users

  user = each.value
  groups = lookup(var.group-memberships, each.value, [])
}

locals {
  // Construct a list of objects/maps with all combinations of group-policy relation.
  group-policy = flatten([
    for g, policies in var.group-policies: [
      for p in policies: {
          group: g
          policy: p
      }
    ]
  ])
}

resource "aws_iam_group_policy_attachment" "group-policy" {
  for_each = {for gp in local.group-policy: "${gp.group}-${gp.policy}}" => gp}

  group = each.value.group
  policy_arn = contains(keys(local.policies), each.value.policy) ? aws_iam_policy.policy[each.value.policy].arn : "arn:aws:iam::aws:policy/${each.value.policy}"
}
