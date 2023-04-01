module "s3_bucket_qa" {
  source = "git::https://github.com/birnazarova/s3_bucket_module.git?ref=v0.0.1" #../s3_bucket_module
  bucket_name = "our-qa-bucket"
}

