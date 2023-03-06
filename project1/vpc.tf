# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE VPC, IGW and Subnets:
# 1 VPC
# 1 IGW
# SUBNETS (1 PUBLIC, 1 PRIVATE)
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  tags = {
    Owner = "aika"
  }
}

resource "aws_internet_gateway" "vpc1_igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Owner = "aika"
  }
  depends_on = [aws_vpc.vpc1] # depends_on tells Terraform to complete the aws_vpc.vpc1 resource creation first before starting this one
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.cidr_block_public
  availability_zone = var.availability_zone_public
  tags = {
    Owner = "aika"
  }
  depends_on = [aws_vpc.vpc1]
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.cidr_block_private
  availability_zone = var.availability_zone_private
  tags = {
    Owner = "aika"
  }
  depends_on = [aws_vpc.vpc1]
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE ROUTE TABLES AND ASSOCIATIONS
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_default_route_table" "internet_gateway_rt" {
  default_route_table_id = aws_vpc.vpc1.main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc1_igw.id
  }

  tags = {
    Owner = "aika"
  }

  depends_on = [aws_vpc.vpc1]
}

resource "aws_route_table_association" "internet_gateway_rt_association" {
  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_vpc.vpc1.main_route_table_id

  depends_on = [aws_subnet.public_subnet]
}