resource "aws_s3_bucket" "some_bucket" {
  bucket = var.bucket_name

  tags = {
    "managed-by" = "terraform"
  }
}

resource "aws_s3_bucket_acl" "some_bucket" {
  bucket = aws_s3_bucket.some_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_some_bucket" {
  bucket = aws_s3_bucket.some_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}