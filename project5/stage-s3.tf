module "s3_bucket_stage" {
  source = "git::https://github.com/birnazarova/s3_bucket_module.git?ref=v0.0.1"
  bucket_name = "our-stage-bucket"
}

