##########################################
## Network Single AZ Public Only - Main ##
##########################################

# Create the VPC
resource "aws_vpc" "vpc" {
  cidr_block            = var.vpc_cidr
  enable_dns_hostnames  = var.dns_hostnames
  tags = {
    Name                = "${lower(var.app_name)}-${lower(var.app_environment)}-vpc"
    Environment         = var.app_environment
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  tags = {
    Name            = "${lower(var.app_name)}-${lower(var.app_environment)}-public-subnet"
    Environment     = var.app_environment
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id        = aws_vpc.vpc.id
  tags = {
    Name        = "${lower(var.app_name)}-${lower(var.app_environment)}-igw"
    Environment = var.app_environment
  }
}

# Define the public route table
resource "aws_route_table" "public-rt" {
  vpc_id        = aws_vpc.vpc.id
  route {
    cidr_block  = var.public_rt_cidr_block
    gateway_id  = aws_internet_gateway.ig.id
  }
  tags = {
    Name        = "${lower(var.app_name)}-${lower(var.app_environment)}-public-subnet-rt"
    Environment = var.app_environment
  }
}

# Assign the public route table to the public subnet
resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}