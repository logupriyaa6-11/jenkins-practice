provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"

  tags = {
    Name = "Jenkins-terraform-instance"
  }
}
