##########################################
## Network Single AZ Public Only - Main ##
##########################################

# vpc variables

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

