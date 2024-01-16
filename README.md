# terraform-terragrunt-template
Template for a new project using terraform and terragrunt

Steps to get started:
* Clone this repository and copy the content to a new directory
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
* [Terraform](https://www.terraform.io) v1.4.6 - Infrastructure resource templates
* [Terragrunt](https://terragrunt.gruntwork.io) v0.46.1 - Infrastructure deployment templates

# Deploy

Ensure you have refreshed AWS credentials for target AWS account.

```zsh
cd deployments/dev/template
terragrunt init
terragrunt plan
terragrunt apply
```