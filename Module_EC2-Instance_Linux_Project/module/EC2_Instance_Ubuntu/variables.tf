########################################
## Virtual Machine Module - Variables ##
########################################

variable "app_name" {}
variable "app_environment" {}

variable "ubuntu_instance_name" {}

variable "ubuntu_instance_type" {}
variable "publiic_subnet_id" {}
variable "aws_security_group_id" {}
variable "ubuntu_associate_public_ip_address" {}
variable "source_dest_check_tf" {}
variable "aws_key_name" {}

variable "ubuntu_root_volume_size" {}
variable "ubuntu_root_volume_type" {}
variable "root_encrypted_tf" {}
variable "root_delete_on_termination" {}

