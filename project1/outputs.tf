output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "security_group_id" {
  value = aws_security_group.allow_ssh_and_http.id
}

output "instance_ip" {
  value = aws_instance.frontend.public_ip
}

output "ami" {
  value = aws_instance.frontend.ami
}