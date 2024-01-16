locals {
  repository_name = "terraform-terragrunt-template" # UPDATE!
  env_vars        = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  aws_region      = local.env_vars.locals.aws_region
  env             = local.env_vars.locals.env

  account_vars   = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  aws_account_id = local.account_vars.locals.aws_account_id

  long_name = join("-", [
    lower(local.aws_account_id),
    lower(replace(local.aws_region, "-", "")),
    lower(local.repository_name),
    lower(local.env)
  ])

  state_bucket   = join("-", [local.long_name, "tfstate"])
  dynamodb_table = join("-", [local.long_name, "tflock"])
}

remote_state {
  backend  = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "${local.state_bucket}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.aws_region}"
    encrypt        = true
    dynamodb_table = "${local.dynamodb_table}"
  }
}

inputs = merge(
  {
    repository_name = local.repository_name
  },
  local.env_vars.locals,
  local.account_vars.locals
)