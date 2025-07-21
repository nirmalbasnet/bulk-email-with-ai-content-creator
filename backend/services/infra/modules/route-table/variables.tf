variable "project_name" {
  type        = string
  description = "Project name to tag the resources"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to associate with the subnet"
}

variable "internet_gateway_id" {
  type        = string
  description = "The ID of the Internet Gateway to associate with the route table"
}


