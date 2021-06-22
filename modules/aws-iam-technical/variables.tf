// List of users to create.
variable "users" {
  type = set(string)
}

// List of groups to create.
variable "groups" {
  type = set(string)
}

// List of group memberships for each user.
variable "group-memberships" {
  type = map(set(string))
}

// List of policy attachments for each group.
variable "group-policies" {
  type = map(set(string))
}
