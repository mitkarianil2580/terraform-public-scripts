# configure aws provider

provider "aws" {
  region = var.region
  }


#create security group

module "security_groups" {
  source                          = "../modules/security-group"
  my_ip_address                   = var.my_ip_address
  demo_sg01_sg_name               =  var.demo_sg01_sg_name    
  demo_sg01_sg_description        = var.demo_sg01_sg_description
  demo_sg01_sg_vpc                = var.demo_sg01_sg_vpc      

  demo_sg01_insgress_description  = var.demo_sg01_insgress_description     
  demo_sg01_ingress_from_port     = var.demo_sg01_ingress_from_port   
  demo_sg01_ingress_to_port       =  var.demo_sg01_ingress_to_port  
  demo_sg01_ingress_protocol      =  var.demo_sg01_ingress_protocol  

  demo_sg01_egress_from_port      =  var.demo_sg01_egress_from_port   
  demo_sg01_egress_to_port        =  var.demo_sg01_egress_to_port   
  demo_sg01_egress_protocol       = var.demo_sg01_egress_protocol   
  demo_sg01_egress_cidr_block     = var.demo_sg01_egress_cidr_block   

  demo_sg01_tag_name              =  var.demo_sg01_tag_name  
  
  demo_sg02_sg_name                = var.demo_sg02_sg_name      
  demo_sg02_sg_description         = var.demo_sg02_sg_description
  demo_sg02_sg_vpc                 = var.demo_sg02_sg_vpc

  demo_sg02_insgress_description   = var.demo_sg02_insgress_description    
  demo_sg02_ingress_from_port      = var.demo_sg02_ingress_from_port
  demo_sg02_ingress_to_port        = var.demo_sg02_ingress_to_port  
  demo_sg02_ingress_protocol       = var.demo_sg02_ingress_protocol    

  demo_sg02_egress_from_port       = var.demo_sg02_egress_from_port     
  demo_sg02_egress_to_port         = var.demo_sg02_egress_to_port  
  demo_sg02_egress_protocol        = var.demo_sg02_egress_protocol     
  demo_sg02_egress_cidr_block      = var.demo_sg02_egress_cidr_block
  
  demo_sg02_tag_name               = var.demo_sg02_tag_name 

}

