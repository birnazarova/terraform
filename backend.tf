# terraform {
#   backend "s3" {
#     bucket         = "mybucket"
#     key            = "path/to/my/key"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-locking"
#   }
# }