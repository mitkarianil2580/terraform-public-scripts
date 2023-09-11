#####################################
## Virtual Machine Module - Output ##
#####################################

output "vm_ubuntu_server_instance_name" {
  value = var.ubuntu_instance_name
}

output "vm_ubuntu_server_instance_id" {
  value = aws_instance.ubuntu_server.id
}

output "vm_ubuntu_server_instance_public_dns" {
  value = aws_instance.ubuntu_server.public_dns
}



output "vm_ubuntu_server_instance_private_ip" {
  value = aws_instance.ubuntu_server.private_ip
}