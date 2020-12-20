terraform {
  required_version = ">= 0.11.0"
}

terraform {
  backend "remote" {
    organization = "wwtatctrialaccount"

    workspaces {
      name = "awscloudservice"
    }
  }
}


provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.aws_region


  tags = {
    Name = "var.name"
  }
}
