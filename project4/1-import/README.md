1. Create EC2 instance manually
2. Create provider.tf and versions.tf
3. `terraform init`
4. Create simple EC2 instance terraform resource
5. Import created EC2 instance to tfstate `terraform import aws_instance.instance  i-08ddf67609f0299e8`
6. Run `terraform plan` and see what changes it has
7. Change terraform code until there is no changes to plan