variable "project_name" {
  type        = string
  description = "Project name to tag the resources"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to associate with the subnet"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to assign a public IP address to instances launched in this subnet"
}
