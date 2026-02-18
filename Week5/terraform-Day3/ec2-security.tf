resource "aws_security_group" "ec2_sg_terra" {
  name        = "ec2-sg-terra"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
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
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg_terra.id]
  key_name               = var.key_name

  tags = {
    Name = var.instance_name
  }
}