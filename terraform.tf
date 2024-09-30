provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tcw-tf-12345-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}