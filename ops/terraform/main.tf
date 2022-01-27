provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "distro" {
  ami           = "ami-090006f29ecb2d79a"
  instance_type = "t2.micro"
  tags = {
    Name = "distrojs"
  }
}
