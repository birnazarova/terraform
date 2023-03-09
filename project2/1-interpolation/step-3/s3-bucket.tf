## Create S3 bucket with policy for inbound and outbound email service 
resource "aws_s3_bucket" "bucket_outbound" {
  bucket        = "${var.environment}-${var.region}-outbound" #Instead of "dev-us-east-1-outbound"
  force_destroy = var.force_destroy
}


resource "aws_s3_bucket" "bucket_inbound" {
  bucket        = "${var.environment}-${var.region}-inbound" #Instead of "dev-us-east-1-inbound"
  force_destroy = var.force_destroy
}

#pictures, system logs, access logs, lb logs

# var.service 

# bucket = "${var.environment}-${var.region}-${var.service}-pictures"
# bucket = "${var.environment}-${var.region}-${var.service}-system-logs"
# bucket = "${var.environment}-${var.region}-${var.service}-access-logs"
# bucket = "${var.environment}-${var.region}-${var.service}-lb-logs"