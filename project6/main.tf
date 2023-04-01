provider "aws" {
  region = "us-east-1"
}

locals {
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_availability_zones = ["us-east-1a", "us-east-1b"]
}

resource "aws_vpc" "example_vpc" {
  cidr_block = local.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_subnets" {
  count = length(local.subnet_cidr_blocks) #2

  vpc_id = aws_vpc.example_vpc.id
  cidr_block = local.subnet_cidr_blocks[count.index]
  availability_zone = local.subnet_availability_zones[count.index]

  tags = {
    Name = "example-subnet-${count.index + 1}"
  }
}
