##############################################
## Network Single AZ Public Only - Variables #
##############################################

variable "vpc_cidr" {}
variable "dns_hostnames" {}
variable "app_name" {}
variable "app_environment" {}

#public subnet
variable "public_subnet_cidr" {}

#public route table
variable "public_rt_cidr_block" {}

#region
variable "region" {}



########################################
## Virtual Machine Module - Variables ##
########################################

variable "windows_instance_name" {}

variable "windows_instance_type" {}
variable "windows_associate_public_ip_address" {}
variable "source_dest_check_tf" {}


variable "windows_root_volume_size" {}
variable "windows_root_volume_type" {}
variable "root_encrypted_tf" {}
variable "root_delete_on_termination" {}

variable "windows_data_volume_size" {}
variable "windows_data_volume_type" {}
variable "ebs_data_encrypted" {}
variable "ebs_delete_on_termination" {}



