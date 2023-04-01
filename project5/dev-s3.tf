module "s3_bucket_dev" {
  source = "git::https://github.com/birnazarova/s3_bucket_module.git?ref=v0.0.1"
  bucket_name = "our-dev-bucket"
}

