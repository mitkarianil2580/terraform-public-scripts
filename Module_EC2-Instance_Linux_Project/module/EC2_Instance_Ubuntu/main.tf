###################################
## Virtual Machine Module - Main ##
###################################

# Bootstrapping PowerShell Script
data "template_file" "ubuntu_userdata" {
  template = <<EOF
#!/bin/bash
	sudo apt update -y
  sudo apt install openjdk-17-jre -y
  java -version
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install jenkins -y
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
EOF
}

# Create EC2 Instance
resource "aws_instance" "ubuntu_server" {
  ami                         = data.aws_ami.ubuntu-linux-2204.id
  instance_type               = var.ubuntu_instance_type
  subnet_id                   = var.publiic_subnet_id
  vpc_security_group_ids      = [var.aws_security_group_id]
  associate_public_ip_address = var.ubuntu_associate_public_ip_address
  source_dest_check           = var.source_dest_check_tf
  key_name                    = var.aws_key_name
  user_data                   = data.template_file.ubuntu_userdata.rendered
  
  # root disk
  root_block_device {
    volume_size           = var.ubuntu_root_volume_size
    volume_type           = var.ubuntu_root_volume_type
    encrypted             = var.root_encrypted_tf
    delete_on_termination = var.root_delete_on_termination
  }


  
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-ubuntu-server"
    Environment = var.app_environment
  }
}

