variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "The tenancy of instances launched into the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to tag the resources"
}
