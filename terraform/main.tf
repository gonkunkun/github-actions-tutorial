terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  # bucketは先に作る必要あり
  backend "s3" {
    bucket = "gha-terraform-ysasakidev"
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

provider "aws" {
  region = "ap-northeast-1"
}