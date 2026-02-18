# Import an existing resource from AWS in Terraform state file

provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "source-bucket-123-devops"
}

=> This configuration defines an S3 bucket resource in Terraform
The bucket is already present in the AWS 
Terraform doesn't know that it exist

## Resource Addressing
Format: resource_type.resource_name -> address -> aws_s3_bucket.bucket (internal terraform address)

## What if apply command is runs
Terraform checks the state file for the address (aws_s3_bucket.bucket) -> not found
so it assumes a new s3 bucket should be created -> duplication occurs

## What will import do?
command: terraform import aws_s3_bucket.bucket source-bucket-123-devops
1. takes the resource address -> aws_s3_bucket.bucket
2. Use AWS API to locate -> source-bucket-123-devops
3. Fetch the bucket metadata
4. Writes that metadata to state file -> terraform.tfstate

=> Now, the state file contains the source-bucket-123-devops with address aws_s3_bucket.bucket
(It is not creating any new bucket, it stores the mapping)

## What if plan command is runs now
terraform plan -> checks (configuration .tf file and state file (terraform.tfstate)) 
-> if configuration matches => No changes. Infrastructure is up-to-date.
-> if configuration doesn't match => detect changes and suggest updates