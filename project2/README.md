## Variables in Terraform

* main.tf (vpc.tf, instance.tf, security_groups.tf): var.instance_type 
* terraform.tfvars: instance_type = "t2.micro"
* variables.tf: variable "instance_type" {} 


main.tf :              var.instance_type
terraform.tfvars: instance_type = "t2.large"
variables.tf :       variable "instance_type" {} 
    

main.tf :              var.vpc_cidr
terraform.tfvars: vpc_cidr = "10.10.0.0/16"
variables.tf :       variable "vpc_cidr" {} 


main.tf :              var.security_group_name
terraform.tfvars:  security_group_name = "allow_ssh_and_http"          
variables.tf :       variable "security_group_name" {} 

DRY => Don't repeat yourself 



## Example folder structure in a terraform repo:
```
dev-terraform:
  dev:
    chat_service:
      us-east-1:
        provider.tf
        main.tf
      eu-central-1:
        provider.tf
        main.tf
    weather_service:
      us-east-1:
        provider.tf
        main.tf
      eu-central-1:
        provider.tf
        main.tf
  qa:
    chat_service:
      us-east-1:
        provider.tf
        main.tf
      eu-central-1:
        provider.tf
        main.tf
    weather_service:
      us-east-1:
        provider.tf
        main.tf
      eu-central-1:
        provider.tf
        main.tf
```
