// List of namespaces to create.
variable "namespaces" {
  type = set(string)
}

// Path to local (host path) storage.
variable "data-root" {
  type = string
}
