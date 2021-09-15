provider "aws" {
  region = var.region
}

resource "aws_organizations_account" "aws_account" {
  name      = var.name
  email     = var.email
  role_name = var.role_name

  # There is no AWS Organizations API for reading role_name.
  lifecycle {
    ignore_changes = [role_name]
  }
}
