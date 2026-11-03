# AWS Region onde a VM será provisionada
variable "aws_region" {
  description = "Região AWS utilizada para o provisionamento"
  type        = string
  default     = "us-east-1"
}

# Tipo (especificação) da instância EC2
variable "instance_type" {
  description = "Tipo da instância EC2 para a VM DevOps Lab"
  type        = string
  default     = "t2.micro"
}

# AMI ID da imagem Ubuntu usada na instância
variable "ami_id" {
  description = "AMI ID da imagem Ubuntu Server para a instância"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}
