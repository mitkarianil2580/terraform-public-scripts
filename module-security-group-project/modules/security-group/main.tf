resource "aws_security_group" "demo_sg01_sg" {
  name        = var.demo_sg01_sg_name
  description = var.demo_sg01_sg_description
  vpc_id      = var.demo_sg01_sg_vpc
  ingress {
    description      = var.demo_sg01_insgress_description
    from_port        = var.demo_sg01_ingress_from_port
    to_port          = var.demo_sg01_ingress_to_port
    protocol         = var.demo_sg01_ingress_protocol
    cidr_blocks      = [var.my_ip_address]
    }

  egress {
    from_port        = var.demo_sg01_egress_from_port
    to_port          = var.demo_sg01_egress_to_port
    protocol         = var.demo_sg01_egress_protocol
    cidr_blocks      = [var.demo_sg01_egress_cidr_block]
    }

  tags = {
    Name = var.demo_sg01_tag_name
  }
}


resource "aws_security_group" "demo_sg02_sg" {
  name        = var.demo_sg02_sg_name
  description = var.demo_sg02_sg_description
  vpc_id      = var.demo_sg02_sg_vpc

  ingress {
    description      = var.demo_sg02_insgress_description
    from_port        = var.demo_sg02_ingress_from_port
    to_port          = var.demo_sg02_ingress_to_port
    protocol         = var.demo_sg02_ingress_protocol
    security_groups = [aws_security_group.demo_sg01_sg.id]
    }

  egress {
    from_port        = var.demo_sg02_egress_from_port
    to_port          = var.demo_sg02_egress_to_port
    protocol         = var.demo_sg02_egress_protocol
    cidr_blocks      = [var.demo_sg02_egress_cidr_block]
    }

  tags = {
    Name = var.demo_sg02_tag_name
  }
}
