resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block             = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet 1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block             = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "Subnet 2"
  }
}
