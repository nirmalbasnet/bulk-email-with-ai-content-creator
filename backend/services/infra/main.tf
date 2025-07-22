provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  project_name     = var.project_name
}


module "public_subnet" {
  source                  = "./modules/subnet"
  project_name            = var.project_name
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = var.public_subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

module "private_subnet_1" {
  source                  = "./modules/subnet"
  project_name            = var.project_name
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = var.private_subnet_1_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
}

module "private_subnet_2" {
  source                  = "./modules/subnet"
  project_name            = var.project_name
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = var.private_subnet_2_cidr_block
  availability_zone       = var.secondary_availability_zone
  map_public_ip_on_launch = false
}

module "rds_subnet_group" {
  source              = "./modules/rds-subnet-group"
  project_name        = var.project_name
  private_subnet_id_1 = module.private_subnet_1.subnet_id
  private_subnet_id_2 = module.private_subnet_2.subnet_id
}

module "internet_gateway" {
  source       = "./modules/internet-gateway"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "route_table" {
  source              = "./modules/route-table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  project_name        = var.project_name
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  subnet_id      = module.public_subnet.subnet_id
  route_table_id = module.route_table.route_table_id
}

# Create EC2 instance in public subnet for bastion host
module "ec2_instance_bastion_host" {
  source                 = "./modules/ec2"
  project_name           = var.project_name
  ec2_instance_key_pair  = var.ec2_instance_key_name
  ec2_instance_subnet_id = module.public_subnet.subnet_id
  ec2_security_group_id  = module.security_groups_ec2.ec2_security_group_id
}

module "rds_db" {
  source                = "./modules/rds"
  project_name          = var.project_name
  rds_security_group_id = module.security_groups_rds.rds_security_group_id
  rds_subnet_group_id   = module.rds_subnet_group.rds_subnet_group_id
}

module "security_groups_ec2" {
  source = "./modules/security-groups/ec2"
  vpc_id = module.vpc.vpc_id
}

module "security_groups_rds" {
  source                = "./modules/security-groups/rds"
  vpc_id                = module.vpc.vpc_id
  ec2_security_group_id = module.security_groups_ec2.ec2_security_group_id
}


