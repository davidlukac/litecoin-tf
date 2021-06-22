resource "aws_iam_user" "user" {
  for_each = var.users

  name = each.value

  path = "/technical/"
}

resource "aws_iam_access_key" "iam_access_key" {
  for_each = var.users

  user = each.value
}

// Write created access keys to local file for further usage. BEWARE - This is sensitive information and MUST NOT be
// committed to the repo.
resource local_file iam-access-keys {
  for_each = var.users

  filename = "${path.cwd}/output/iam-keys/${each.value}.keys"

  sensitive_content = "ACCESS_KEY: ${aws_iam_access_key.iam_access_key[each.value].id}\nSECRET_KEY: ${aws_iam_access_key.iam_access_key[each.value].secret}\n"
}
