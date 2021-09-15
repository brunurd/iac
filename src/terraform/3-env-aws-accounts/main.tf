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

module "env_account" {
  source = "../modules/aws-account"

  region    = var.region
  name      = "pezaoshow-${var.stage_lower}"
  email     = "${var.stage_lower}@pezaoshow.com"
  role_name = "OrganizationAccountAccessRole${var.stage}"
}
