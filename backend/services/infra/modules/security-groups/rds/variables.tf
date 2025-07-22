variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the security group will be created"
}

variable "ec2_security_group_id" {
  type        = string
  description = "The ID of the security group to associate with the RDS instance"
}
