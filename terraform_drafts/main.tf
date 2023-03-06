# Use data source to pull the AMI id
data "aws_ami" "amazon-linux-apache" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*apache*"]
  }
}

# Create a EC2 instance
resource "aws_instance" "aikas_instance" {
  ami           = data.aws_ami.amazon-linux-apache.id #"ami-066838a36580a70af"
  instance_type = var.my_instance_type
  associate_public_ip_address = true
}