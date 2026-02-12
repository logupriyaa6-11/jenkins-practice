variable "region" {
  default = "ap-south-1"
  type = string
}

variable "vpc_id" {
  type = string
  description = "Default VPC ID"
}

variable "ami" {
  type = string
  description = "Amazon Linux AMI ID"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
  description = "EC2 Key Pair Name"
}