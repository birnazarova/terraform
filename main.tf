# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Use data source to pull the AMI id
data "aws_ami" "amazon-linux-apache" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*apache*"]
  }
}

# Create a EC2 instance
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amazon-linux-apache.id
  instance_type = var.instance_type #"t2.micro"
}

