variable "region" {
  type        = string
  description = "The AWS account."
}

variable "name" {
  type        = string
  description = "The AWS account name."
}

variable "email" {
  type        = string
  description = "The account owner email."
}

variable "role_name" {
  type        = string
  description = "The name of a new IAM role to be created to grant access to the management accout to the account resources."
}
