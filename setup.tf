provider "aws" {
  region     = var.aws_region
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
}

resource "aws_s3_bucket" "chicago-ska-bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
