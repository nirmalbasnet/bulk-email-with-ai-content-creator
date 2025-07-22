variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/26"
}

variable "public_subnet_cidr_block" {
  default = "10.0.0.0/27"
}

variable "private_subnet_1_cidr_block" {
  default = "10.0.0.32/28"
}

variable "private_subnet_2_cidr_block" {
  default = "10.0.0.48/28"
}
variable "instance_tenancy" {
  default = "default"
}
variable "project_name" {
  default = "bulk-email-with-ai-content-creator"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "secondary_availability_zone" {
  default = "ap-south-1b"
}

variable "ec2_instance_key_name" {
  default = "ssh-key"
}









