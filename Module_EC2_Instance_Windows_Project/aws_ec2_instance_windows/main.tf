# vpc module

module "aws_vpc" {
  source               = "../module/VPC"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  dns_hostnames        = var.dns_hostnames 
  app_name             = var.app_name
  app_environment      = var.app_environment
  public_subnet_cidr   = var.public_subnet_cidr
  public_rt_cidr_block = var.public_rt_cidr_block
  
}

# key_pair module

module "aws_key_pair" {
  source          = "../module/Key_Pair"
  app_name        = module.aws_vpc.app_name
  app_environment = module.aws_vpc.app_environment
  region          = module.aws_vpc.region
}

#Security group module

module "security_group" {
  source          = "../module/Security_Group"
  vpc_id          = module.aws_vpc.vpc_id
  app_name        = module.aws_vpc.app_name
  app_environment = module.aws_vpc.app_environment
}

#instance module

module "aws_instance" {
  source                              = "../module/ec2-instance-windows"
  app_name                            = module.aws_vpc.app_name
  app_environment                     = module.aws_vpc.app_environment
  windows_instance_name               = var.windows_instance_name
  windows_instance_type               = var.windows_instance_type
  publiic_subnet_id                   = module.aws_vpc.publiic_subnet_id
  aws_security_group_id               = module.security_group.aws_security_group_id
  windows_associate_public_ip_address = var.windows_associate_public_ip_address
  source_dest_check_tf                = var.source_dest_check_tf
  aws_key_name                        = module.aws_key_pair.aws_key_name
  windows_root_volume_size            = var.windows_root_volume_size
  windows_root_volume_type            = var.windows_root_volume_type
  root_encrypted_tf                   = var.root_encrypted_tf
  root_delete_on_termination          = var.root_delete_on_termination
  windows_data_volume_size            = var.windows_data_volume_size
  windows_data_volume_type            = var.windows_data_volume_type
  ebs_data_encrypted                  = var.ebs_data_encrypted
  ebs_delete_on_termination           = var.ebs_delete_on_termination
}



# this command will get instance name and id 
# aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId, Tags[?Key==`Name`].Value | [0]]' --output json


# this command is used to decrypt the password using instance id
# aws ec2 get-password-data --priv-launch-key private-key.pem --instance-id i-0jsnelksnt125 