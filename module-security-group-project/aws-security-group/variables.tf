variable "region" {}

##################################
# Define variables

variable "my_ip_address" {}
variable "demo_sg01_sg_name" {}
variable "demo_sg01_sg_description" {}
variable "demo_sg01_sg_vpc" {}

variable "demo_sg01_insgress_description" {}
variable "demo_sg01_ingress_from_port" {}
variable "demo_sg01_ingress_to_port" {}
variable "demo_sg01_ingress_protocol" {}


variable "demo_sg01_egress_from_port" {}
variable "demo_sg01_egress_to_port" {}
variable "demo_sg01_egress_protocol" {}
variable "demo_sg01_egress_cidr_block" {}

variable "demo_sg01_tag_name" {}


#########################################

# ansible-slave sg variables

variable "demo_sg02_sg_name" {}
variable "demo_sg02_sg_description" {}
variable "demo_sg02_sg_vpc" {}

variable "demo_sg02_insgress_description" {}
variable "demo_sg02_ingress_from_port" {}
variable "demo_sg02_ingress_to_port" {}
variable "demo_sg02_ingress_protocol" {}


variable "demo_sg02_egress_from_port" {}
variable "demo_sg02_egress_to_port" {}
variable "demo_sg02_egress_protocol" {}
variable "demo_sg02_egress_cidr_block" {}

variable "demo_sg02_tag_name" {}
