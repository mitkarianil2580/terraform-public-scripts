# Application Definition 
app_name        = "netflix" # Do NOT enter any spaces
app_environment = "dev"       # Dev, Test, Staging, Prod, etc

# Network
vpc_cidr           = "172.31.0.0/16"
dns_hostnames      = "true"
public_subnet_cidr = "172.31.0.0/20"
public_rt_cidr_block = "0.0.0.0/0"


region     = "ap-south-1"

# ubuntu Virtual Machine
ubuntu_instance_name               = "test-ubuntu-ec2"
ubuntu_instance_type               = "t2.micro"
ubuntu_associate_public_ip_address = true
source_dest_check_tf                = false
ubuntu_root_volume_size            = 30
ubuntu_root_volume_type            = "gp3"
root_encrypted_tf                   = true    
root_delete_on_termination          = true
