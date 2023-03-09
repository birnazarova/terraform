variable "region" {}
variable "environment" {}
variable "force_destroy" {}

variable "buckets" {
  type = set(string)
}