terraform {
  backend "s3" {
    bucket = "tf-state-aika"
    key    = "tfstate/"
    region = "us-east-1"
  }
}