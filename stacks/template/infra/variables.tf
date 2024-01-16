# Generic variables

variable "repository_name" {
  type        = string
  description = "Name of the repository"
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all resource names"
}

variable "env" {
  type        = string
  description = "Name of the environment/stack"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "log_retention_in_days" {
  type        = string
  description = "Log retention"
}