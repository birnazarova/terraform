output "instance_ip" {
  value = aws_instance.aikas_instance.public_ip
}

output "ami" {
  value = aws_instance.aikas_instance.ami
}