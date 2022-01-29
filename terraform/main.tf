terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
    bucket = "gha-terraform"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_instance" "app_server" {
  ami = "ami-08455f1340543554"
  instance_type = "t2.micro"

  tags = {
    Name = "ExsampleEC2Instance"
  }
}