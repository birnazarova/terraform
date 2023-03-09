variable "region" {}
variable "environment" {}
variable "force_destroy" {}

variable "outbound_email" {
  type = bool
}
variable "inbound_email" {
  type = bool
}

#boolean: true or false