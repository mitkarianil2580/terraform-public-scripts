########################################
## Virtual Machine Module - Variables ##
########################################

variable "app_name" {}
variable "app_environment" {}

variable "windows_instance_name" {}

variable "windows_instance_type" {}
variable "publiic_subnet_id" {}
variable "aws_security_group_id" {}
variable "windows_associate_public_ip_address" {}
variable "source_dest_check_tf" {}
variable "aws_key_name" {}

variable "windows_root_volume_size" {}
variable "windows_root_volume_type" {}
variable "root_encrypted_tf" {}
variable "root_delete_on_termination" {}

variable "windows_data_volume_size" {}
variable "windows_data_volume_type" {}
variable "ebs_data_encrypted" {}
variable "ebs_delete_on_termination" {}






