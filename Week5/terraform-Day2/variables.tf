variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "public_ip_on_launch" {
  description = "Enable auto public IP for public subnet"
  type        = bool
  default     = true
}

variable "private_ip_on_launch" {
  description = "Enable auto public IP for private subnet"
  type        = bool
  default     = false
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
}