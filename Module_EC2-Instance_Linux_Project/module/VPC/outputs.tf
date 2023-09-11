output "region" {
  value = var.region
}

output "app_name" {
  value = var.app_name
}

output "app_environment" {
  value = var.app_environment
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}


output "publiic_subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "internet_gateway" {
  value = aws_internet_gateway.ig
}
