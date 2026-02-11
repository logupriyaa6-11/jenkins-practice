variable "region" {
  default = "ap-south-1"
}

variable "vpc_id" {
  description = "Default VPC ID"
}

variable "ami" {
  description = "Amazon Linux AMI ID"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
}