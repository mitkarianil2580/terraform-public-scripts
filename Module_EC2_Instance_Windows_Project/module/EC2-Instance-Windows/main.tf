###################################
## Virtual Machine Module - Main ##
###################################

# Bootstrapping PowerShell Script
data "template_file" "windows-userdata" {
  template = <<EOF
<powershell>
# Rename Machine
Rename-Computer -NewName "${var.windows_instance_name}" -Force;

# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools;

# Restart machine
shutdown -r -t 10;
</powershell>
EOF
}

# Create EC2 Instance
resource "aws_instance" "windows-server" {
  ami                         = data.aws_ami.windows-2019.id
  instance_type               = var.windows_instance_type
  subnet_id                   = var.publiic_subnet_id
  vpc_security_group_ids      = [var.aws_security_group_id]
  associate_public_ip_address = var.windows_associate_public_ip_address
  source_dest_check           = var.source_dest_check_tf
  key_name                    = var.aws_key_name
  user_data                   = data.template_file.windows-userdata.rendered
  
  # root disk
  root_block_device {
    volume_size           = var.windows_root_volume_size
    volume_type           = var.windows_root_volume_type
    encrypted             = var.root_encrypted_tf
    delete_on_termination = var.root_delete_on_termination
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.windows_data_volume_size
    volume_type           = var.windows_data_volume_type
    encrypted             = var.ebs_data_encrypted
    delete_on_termination = var.ebs_delete_on_termination
  }
  
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-windows-server"
    Environment = var.app_environment
  }
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "windows-eip" {
  domain = "vpc"  
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-windows-eip"
    Environment = var.app_environment
  }
}


# Associate Elastic IP to Windows Server
resource "aws_eip_association" "windows-eip-association" {
  instance_id   = aws_instance.windows-server.id
  allocation_id = aws_eip.windows-eip.id
}
