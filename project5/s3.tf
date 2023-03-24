module "s3_bucket" {
  source = "../s3_bucket_module"
  bucket_name = "bucket-from-s3-module"
}