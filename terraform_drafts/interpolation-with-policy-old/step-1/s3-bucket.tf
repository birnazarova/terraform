## Create S3 bucket with policy for inbound and outbound email service 
resource "aws_s3_bucket" "bucket_outbound" {
  bucket        = "dev-us-east-1-outbound"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "policy_outbound" {
  bucket = "dev-us-east-1-outbound"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
        "arn:aws:s3:::dev-us-east-1-outbound",
        "arn:aws:s3:::dev-us-east-1-outbound/*",
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