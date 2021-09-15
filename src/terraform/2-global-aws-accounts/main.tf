terraform {
  required_version = "1.0.6"

  required_providers {
    aws = {
      version = ">= 3.56.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.region
}

resource "aws_organizations_organization" "org" {
  feature_set = "CONSOLIDATED_BILLING"
}
