terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

locals {
	instances = {"rk1":"ami-06bb074d1e196d0d4","rk2":"ami-0df609f69029c9bdb","rk3":"ami-08cd0547bf85331e7","rk4":"ami-0df609f69029c9bdb"}
}

resource "aws_instance" "my_ec2_test" {
  for_each      = local.instances
  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = each.key 
  }
}
