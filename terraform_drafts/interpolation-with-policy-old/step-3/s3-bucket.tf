## Create S3 bucket with policy for inbound and outbound email service 
resource "aws_s3_bucket" "bucket_outbound" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_policy" "policy_outbound" {
  bucket = aws_s3_bucket.bucket_outbound.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.bucket_outbound.arn,
          "${aws_s3_bucket.bucket_outbound.arn}/*",
        ]
        Condition = {
          "Bool" = {
            "aws:SecureTransport" : "false"
          },
          "NumericLessThan" : {
            "s3:TlsVersion" : "1.2"
          }
        }
      },
    ]
  })
}