# Terraform

## Files structure

```
├── .gitignore
├── .terraform
│   └── providers
│       └── registry.terraform.io
│           └── hashicorp
│               └── aws
│                   └── 3.76.1
│                       └── darwin_amd64
│                           └── terraform-provider-aws_v3.76.1_x5
├── .terraform.lock.hcl
├── README.md
├── main.tf
├── terraform.tfstate
└── terraform.tfstate.backup
```

* .terraform.lock.hcl - contains information about the specific dependencies and providers that are installed within this workspace.
* main.tf - resources definition (which resources will be created?)
* terraform.tfstate - state file for the resources created by Terraform (used for tracking the resources, don't delete it, otherwise Terraform won't be able to watch the resources it created)
* terraform.tfstate.backup - backup for the state file