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

# Busca a AMI mais recente do Ubuntu Server 24.04 LTS (x86_64) no AWS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp*ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Recurso que provisiona a VM Linux (Ubuntu) com Docker e Nginx via Cloud-Init
resource "aws_instance" "vm_devops_lab" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  user_data = file("${path.module}/user-data.yaml")

  tags = {
    Name = "vm-devops-lab"
  }
}
