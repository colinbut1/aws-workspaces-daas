# AWS Workspaces - Desktop As A Service

This repo contains the automation of setting up external desktop access (via the use of aws workspaces).

This repo is split into "layers" where each a specific layer is depending on another layer.

The main reasons for splitting the stack up into layers is:

- Manual steps need to perform in between setting up AD (AWS Directory Service), aws Workspaces < AD User Management & Directory Details Update.
- We need to create users in AD & currently this is not possible to automate via Terraform because AWS doesn't support users management in AD via its API.
- We can easily separate each layer into its own repo if we want to since each layer represents an independent functionality

Layer Ordering:

- directory
- <manual step: Create User in AD>
- <manual step: Update AD details>
- workspaces

## Prerequisites

- your AWS credentials

## Provision

```bash
export ENV=__env__
export LAYER=__layer__
cd environments/$ENV
terraform init ../../layers/$LAYER
terraform plan ../../layers/$LAYER
terraform apply ../../layers/$LAYER
```

where __env__ can be of "dev", "uat", or "prod" & __layer__ id=s of "directory" or "workspaces"
