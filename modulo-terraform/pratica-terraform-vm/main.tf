terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Recurso que provisiona a VM Linux (Ubuntu) com Docker e Nginx via Cloud-Init
resource "aws_instance" "vm_devops_lab" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = file("${path.module}/user-data.yaml")

  tags = {
    Name = "vm-devops-lab"
  }
}
