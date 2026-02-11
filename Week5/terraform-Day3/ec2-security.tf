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