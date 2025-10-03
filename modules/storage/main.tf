variable "bucket_name" {
  type = string
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
