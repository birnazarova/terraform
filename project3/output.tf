output "elb_ip" {
  value = aws_elb.elb.dns_name
}