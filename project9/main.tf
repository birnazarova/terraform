provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "terraform_ec2_key"
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

resource "aws_instance" "frontend" {
  ami                         = "ami-00c39f71452c08778"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.terraform_ec2_key.id
  subnet_id                   = "subnet-0f55cdb0d88833bf4"
  associate_public_ip_address = true
  security_groups             = ["sg-08f0089e047855082"]

  connection {
    type = "ssh"
    user        = "ec2-user"
    private_key = file("/Users/aika/Git/terraform/project9/terraform_ec2_key.pem")
    host = "${self.private_ip}"
  } 

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
    ]
  }

  tags = {
    Name  = "frontend"
    Owner = "aika"
  }
}

output "public_ip" {
  value = aws_instance.frontend.public_ip
}
