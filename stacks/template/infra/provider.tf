provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.env
      StackName   = join(":", [var.repository_name, var.prefix, var.env])
    }
  }
}