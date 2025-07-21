provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  project_name     = var.project_name
}


module "public_subnet" {
  source                  = "./modules/subnet"
  project_name            = var.project_name
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = "10.0.0.0/28"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

module "private_subnet" {
  source                  = "./modules/subnet"
  project_name            = var.project_name
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr_block       = "10.0.0.16/28"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
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


