# terraform-terragrunt-template
Template for a new project using terraform and terragrunt

Steps to get started:
* Create a new repository using this template (click "Use this template" on GitHub)
* Search for "UPDATE!" and replace them with values meaningful to your project
* Rename the following with a meaningful and descriptive name according to your project:
  * stacks/.../template - stacks/.../frontend
  * deployments/account/dev/template - should match the name you chose in above
  * you should also give descriptive name for the following:
    * 'account' folder if you're planning to provision to multiple AWS accounts

You might then evolve to something like this (and way further):
```
my-project
|-deployments
  |-prod-account
    |-prod
      |-api
      |-storage
  |-test-account
    |-test
      |-api
      |-storage
    |-dev
      |-api
      |-storage
|-stacks
  |-api
    |-infra
    |-code
  |-storage
    |-infra
    |-code
```

Repository is divided in two parts:

* stacks - Contains terraform templates that defines terraform resources, which will be deployed to AWS
* deployments - Contains terragrunt templates that define the details for deployments e.g. which AWS account to use

## Required Tools

The following tools are used:
* [Terraform](https://www.terraform.io) v1.14 - Infrastructure resource templates
* [Terragrunt](https://terragrunt.gruntwork.io) v1.0.3 - Infrastructure deployment templates

# Deploy

Ensure you have refreshed AWS credentials for target AWS account.

```zsh
cd deployments/account/dev/template
terragrunt init
terragrunt plan --backend-bootstrap
terragrunt apply
```

Note: `--backend-bootstrap` is needed on first run to provision the S3 state bucket. After that, plain `terragrunt plan` / `terragrunt apply` is sufficient.