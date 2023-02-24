variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "db_password" {
  type      = string
  sensitive = true
}

