resource "aws_s3_bucket" "some_bucket" {
  bucket   = var.bucket_name
  tags = {
    "managed-by" = "terraform"
  }
}

resource "aws_s3_bucket_acl" "some_bucket_acl" {
  bucket = aws_s3_bucket.some_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "some_bucket_versioning" {
  bucket = aws_s3_bucket.some_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "some_bucket_config" {
  bucket = aws_s3_bucket.some_bucket.id
  rule {
    id = "move-to-ia-or-glacier"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    status = "Enabled"
  }
}