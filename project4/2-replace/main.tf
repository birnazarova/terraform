terraform {
  required_version = "~> 1.3.9"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  count = 2
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-replace-${count.index+1}"
  }
}