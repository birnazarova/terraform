resource "aws_s3_bucket" "bucket_outbound" {
  bucket        = var.bucket_name_outbound
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket" "bucket_inbound" {
  bucket        = var.bucket_name_inbound
  force_destroy = var.force_destroy
}
