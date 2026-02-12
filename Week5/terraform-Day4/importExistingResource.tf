provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "source-bucket-123-devops"
}