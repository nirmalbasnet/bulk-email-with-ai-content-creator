variable "project_name" {
  type        = string
  description = "value for project name"
}

variable "private_subnet_id_1" {
  type        = string
  description = "ID of the first private subnet for RDS"
}

variable "private_subnet_id_2" {
  type        = string
  description = "ID of the second private subnet for RDS"
}
