variable "region" {
  type        = string
  description = "The AWS region."
}

variable "stage" {
  type        = string
  description = "The current stage of the environment."
}

variable "stage_lower" {
  type        = string
  description = "The current stage of the environment in lower case."
}
