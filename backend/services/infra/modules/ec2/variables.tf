variable "ec2_instance_type" {
  type        = string
  description = "The instance type for the EC2 instance"
  default     = "t3.micro"
}

variable "ec2_instance_subnet_id" {
  type        = string
  description = "The ID of the subnet where the EC2 instance will be launched"
}

variable "project_name" {
  type        = string
  description = "Project name to tag the resources"
}

variable "ec2_instance_key_pair" {
  type        = string
  description = "The key pair name to use for the EC2 instance"
}

variable "ec2_security_group_id" {
  type        = string
  description = "The ID of the security group to associate with the EC2 instance"
}
