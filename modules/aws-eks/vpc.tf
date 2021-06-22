resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default-a" {
  availability_zone = "${var.region}a"
}
resource "aws_default_subnet" "default-b" {
  availability_zone = "${var.region}b"
}
resource "aws_default_subnet" "default-c" {
  availability_zone = "${var.region}c"
}

resource "aws_default_security_group" "default" {}
