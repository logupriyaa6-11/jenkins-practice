# Create a VPC and Subnets in AWS using Terraform

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }
}

- This block cretes the VPC

## Resource addressing
Format: resource_type.resource_name -> address
this is how it stores in state, builds dependency graph, detects chnages

## How it is stored in terraform state file
After terraform apply, terraform created terraform.tfstate
Inside the statefile the resources are stored using their full address in json format
VPC will be created with ID -> eg., vpc-0efec3016b07ec2bc

## How reference works internally
While creating subnets, the vpc id is accessed using the reference -> aws_vpc.main.id 
- looks inside the state file 
- find the resource with the address (aws_vpc.main)
- extract id
- use it for creting the subnets

## Execution order
- Bottom-to-top approach 
aws_subnet.public  -> depends on -> aws_vpc.main
aws_subnet.private -> depends on -> aws_vpc.main
- It will create dependencies 
execution order:
- creting VPC 
- wait until it is getting created (confirmation)
- create subnet

## How Terraform Knows What to Create
- Terraform compares .tf and terraform.tfstate file 
    - if resource address is not found -> create 
    - if resource already exist -> compare -> update/replace