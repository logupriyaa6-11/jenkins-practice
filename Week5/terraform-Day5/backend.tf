terraform {
  backend "s3" {
    bucket = "src-bucket-image-copy-123-devops"
    key    = "terraform-Day5/terraform.tfstate"
    region = "ap-south-1"
  }
}