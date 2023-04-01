provider "aws" {
  region = "us-east-1"
}

locals {
  vpc = {
    cidr_block = "10.0.0.0/16"
  }
  subnets = {
    subnet_1 = {
      cidr_block = "10.0.1.0/24"
      availability_zone = "us-east-1a"
    },
    subnet_2 = {
      cidr_block = "10.0.2.0/24"
      availability_zone = "us-east-1b"
    }
  }
}

resource "aws_vpc" "example_vpc" {
  cidr_block = local.vpc.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_subnets" {
  for_each = local.subnets

  vpc_id = aws_vpc.example_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}
