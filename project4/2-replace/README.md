# Taint
The terraform taint command informs Terraform that a particular object has become degraded or damaged. Terraform represents this by marking the object as "tainted" in the Terraform state, and Terraform will propose to replace it in the next plan you create.

Starting with Terraform version 0.15.2 and onwards, the taint command is deprecated, and it is suggested to use apply command with the -replace flag

# Replace
1. Create an EC2 instance with terraform
2. Run `terraform apply -replace="aws_instance.instance"` to replace the instance

# Target
`terraform destroy(apply) --target="aws_instance.instance"`
