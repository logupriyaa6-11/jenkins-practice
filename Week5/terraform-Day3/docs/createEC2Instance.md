# Create EC2 instance (Windows/Linux) using Terraform inside the previously created VPC & Subnet

resource "aws_security_group" "ec2_sg_terra" {
  name        = "ec2-sg-terra"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-grp-terra"
  }
}

resource "aws_instance" "ec2_terra" {
  ami                    = "ami-0317b0f0a0144b137"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg_terra.id]
  key_name               = "key-terra"

  tags = {
    Name = "terraform-ec2"
  }
}

## Resource Addressing
Format: resource_type.resource_name → address
Addresses created from this configuration:
- aws_security_group.ec2_sg_terra
- aws_instance.ec2_terra

terraform apply -> store it in terraform.tfstate
security_group -> gets id -> sg-081f0103bf658649c
ec2_instance -> gets id -> i-01bbba755cbc83b7b

state mapping:
aws_security_group.ec2_sg_terra -> sg-0abc123xyz
aws_instance.ec2_terra -> i-0abc456xyz

## Execution order
It builds dependency graph

aws_vpc.main -> aws_subnet.public -> aws_security_group.ec2_sg_terra -> aws_instance.ec2_terra

- Execution Flow:
1. Confirm VPC exists
2. Confirm Subnet exists
3. Create Security Group
4. Wait for confirmation
5. Create EC2 Instance
6. Attach Security Group
7. Launch instance inside subnet