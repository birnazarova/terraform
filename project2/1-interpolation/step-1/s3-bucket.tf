resource "aws_s3_bucket" "bucket_outbound" {
  bucket        = "dev-us-east-1-outbound"
  force_destroy = true
}

resource "aws_s3_bucket" "bucket_inbound" {
  bucket        = "dev-us-east-1-inbound"
  force_destroy = true
}