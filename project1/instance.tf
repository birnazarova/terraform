resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.tls_connector.public_key_openssh

  tags = {
    Owner = "aika"
  }
}

resource "local_file" "terraform_ec2_key_file" {
  content  = tls_private_key.tls_connector.private_key_pem
  filename = "terraform_ec2_key.pem"

  provisioner "local-exec" {
    command = "chmod 400 terraform_ec2_key.pem"
  }
}

data "aws_ami" "amazon-linux-apache" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*apache*"]
  }
}

resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.amazon-linux-apache.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.terraform_ec2_key.id
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh_and_http.id]

  tags = {
    Name  = "frontend"
    Owner = "aika"
  }
}

resource "aws_instance" "imported_instance" {
  ami           = default
  instance_type = "t2.micro"
}