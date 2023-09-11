region="ap-south-1"

#########################################
#secutiry group

my_ip_address="198.187.653.159/32"
demo_sg01_sg_name="demo-ec2-windows-sg-sg"
demo_sg01_sg_description="this is demo-ec2-windows-sg sg"     
demo_sg01_sg_vpc="vpc-0965d56f"     

demo_sg01_insgress_description="allow all ports in demo-ec2-windows-sg sg"     
demo_sg01_ingress_from_port=0     
demo_sg01_ingress_to_port=65535     
demo_sg01_ingress_protocol="tcp"     

demo_sg01_egress_from_port=0     
demo_sg01_egress_to_port=0     
demo_sg01_egress_protocol="-1"     
demo_sg01_egress_cidr_block="0.0.0.0/0"     

demo_sg01_tag_name="Demo-Ec2-Windows-Security-Group"   


demo_sg02_sg_name="demo-ec2-linux-sg sg"     
demo_sg02_sg_description="this is demo-ec2-linux-sg sg"     
demo_sg02_sg_vpc="vpc-0965d56f"

demo_sg02_insgress_description="allow all tcp in demo-ec2-linux-sg sg"    
demo_sg02_ingress_from_port=0  
demo_sg02_ingress_to_port=65535   
demo_sg02_ingress_protocol="tcp"     

demo_sg02_egress_from_port=0     
demo_sg02_egress_to_port=0   
demo_sg02_egress_protocol="-1"     
demo_sg02_egress_cidr_block="0.0.0.0/0"     

demo_sg02_tag_name="Demo-Ec2-Linux-Security-Group"
  
