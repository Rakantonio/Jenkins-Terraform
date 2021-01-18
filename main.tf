terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Configure the AWS provider
provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance_ynov" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = var.key_name

  tags = {
    Name = var.instance_name
    Deployement = "Created by Terraform"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = var.resource_name

  ingress {
    description = "SSH from Instance"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.resource_name
  }
}   
