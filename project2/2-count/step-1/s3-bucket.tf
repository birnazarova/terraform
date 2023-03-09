resource "aws_s3_bucket" "bucket_outbound" {
  count         = 3
  bucket        = "${var.environment}-${var.region}-outbound-${count.index+1}" #If it's just ${count.index} then first bucekt will start from zero
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket" "bucket_inbound" {
  count         = 3
  bucket        = "${var.environment}-${var.region}-inbound-${count.index+1}" #If it's just ${count.index} then first bucekt will start from zero
  force_destroy = var.force_destroy
}