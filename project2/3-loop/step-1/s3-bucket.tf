## Create S3 bucket with policy for inbound and outbound email service 
resource "aws_s3_bucket" "bucket" {
  for_each      = var.buckets
  bucket        = "${var.environment}-${var.region}-${each.value}"
  force_destroy = var.force_destroy
}


# "${var.environment}-${var.region}-${each.value}"

# dev-us-east-1-outbound
# dev-us-east-1-inbound
# dev-us-east-1-aika
# dev-us-east-1-bucket-4