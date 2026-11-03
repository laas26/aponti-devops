# Output: IP público atribuído à VM provisionada
output "public_ip" {
  description = "IP público da VM DevOps Lab"
  value       = aws_instance.vm_devops_lab.public_ip
}
