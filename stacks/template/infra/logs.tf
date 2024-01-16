resource "aws_cloudwatch_log_group" "example" {
  name              = join("-", [var.env, var.prefix, "example"])
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "example" {
  name           = join("-", [var.env, var.prefix, "example"])
  log_group_name = aws_cloudwatch_log_group.example.name
}