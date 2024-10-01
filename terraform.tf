provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket   = "tcw-terrafomr-state-lock"
    key      = "dev/s3-bucket/terraform.tfstate"
    region   = "us-east-1"
    encrypt        = true
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tcw-tf-00000-${var.env}-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = var.env
  }
}

variable "env" {}

#testing