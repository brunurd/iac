terraform {
  required_version = "1.0.6"

  required_providers {
    aws = {
      version = ">= 3.56.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = "${var.bucket_prefix}terraform-remote-state-${var.stage_lower}"
  acl    = "private"

  tags = {
    Name        = "${var.bucket_prefix}terraform-remote-state-${var.stage_lower}"
    Environment = var.stage
  }
}

resource "aws_dynamodb_table" "lock_table" {
  name           = "terraform-lock-${var.stage_lower}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
