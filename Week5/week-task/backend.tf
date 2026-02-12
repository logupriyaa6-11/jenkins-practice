terraform {
  backend "s3" {
    bucket         = "devops-terra-bucket-123"
    key            = "week-task/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}