# AWS Availability Zones data
data "aws_availability_zones" "available" {}

######################################

# Create the VPC
resource "aws_vpc" "redshift-serverless-vpc" {
  cidr_block           = var.redshift_serverless_vpc_cidr
  enable_dns_hostnames = true
  
  tags = {
    Name        = "<some name>"
    Environment = var.app_environment
  }
}

######################################

# Create the Redshift Subnet AZ1
resource "aws_subnet" "redshift-serverless-subnet-az1" {
  vpc_id            = aws_vpc.redshift-serverless-vpc.id
  cidr_block        = var.redshift_serverless_subnet_1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = {
    Name        = "<some name>"
    Environment = var.app_environment
  }
}

# Create the Redshift Subnet AZ2
resource "aws_subnet" "redshift-serverless-subnet-az2" {
  vpc_id            = aws_vpc.redshift-serverless-vpc.id
  cidr_block        = var.redshift_serverless_subnet_2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  
  tags = {
    Name        = "<some name>"
    Environment = var.app_environment
  }
}

# Create the Redshift Subnet AZ3
resource "aws_subnet" "redshift-serverless-subnet-az3" {
  vpc_id            = aws_vpc.redshift-serverless-vpc.id
  cidr_block        = var.redshift_serverless_subnet_3_cidr
  availability_zone = data.aws_availability_zones.available.names[2]
  
  tags = {
    Name        = "<some name>"
    Environment = var.app_environment
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.redshift-serverless-vpc.id

  tags = {
    Name        = "<some name>"
    Environment = var.app_environment
  }
}

resource "aws_default_route_table" "redshift-serveless-vpc-route-table" {
  default_route_table_id = aws_vpc.redshift-serverless-vpc.default_route_table_id

  route {
    cidr_block = var.redshift_serverless_vpc_route_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "<some name>"
    Environment = var.app_environment
  }
}