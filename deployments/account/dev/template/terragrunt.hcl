include "root" {
  path = find_in_parent_folders()
}

locals {
  prefix      = "template" # UPDATE! Keep this short (5-10 chars) as prefix is added to all resources
  base_source = "${dirname(find_in_parent_folders())}/../stacks/template//infra"
}

terraform {
  source = local.base_source
}

inputs = {
  prefix = local.prefix
}