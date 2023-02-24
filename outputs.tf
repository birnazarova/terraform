output "instance_ip" {
  value = aws_instance.myec2.public_ip
}

output "ami" {
  value = aws_instance.myec2.ami
}