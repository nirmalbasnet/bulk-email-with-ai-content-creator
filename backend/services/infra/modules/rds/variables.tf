variable "rds_db_engine" {
  type        = string
  description = "The database engine for RDS"
  default     = "postgres"
}

variable "rds_db_engine_version" {
  type        = string
  description = "The version of the database engine"
  default     = "17.4-R1"
}

variable "rds_db_instance_class" {
  type        = string
  description = "The instance class for the RDS database"
  default     = "db.t3.micro"
}

variable "rds_db_allocated_storage" {
  type        = number
  description = "The allocated storage size for the RDS database in GB"
  default     = 10
}

variable "rds_db_db_name" {
  type        = string
  description = "The name of the RDS database"
  default     = "email_campaign"
}

variable "rds_db_username" {
  type        = string
  description = "The username for the RDS database"
  default     = "db_admin"
}

variable "manage_master_user_password" {
  type        = bool
  description = "Whether to manage the master user password for the RDS instance"
  default     = true
}

variable "rds_db_skip_final_snapshot" {
  type        = bool
  description = "Whether to skip the final snapshot when deleting the RDS instance"
  default     = true
}

variable "rds_db_publicly_accessible" {
  type        = bool
  description = "Whether the RDS instance should be publicly accessible"
  default     = false
}

variable "rds_db_multi_az" {
  type        = bool
  description = "Whether to create a Multi-AZ RDS instance"
  default     = false
}

variable "rds_db_backup_retention_period" {
  type        = number
  description = "The number of days to retain backups for the RDS instance"
  default     = 0
}

variable "project_name" {
  type        = string
  description = "Project name to tag the resources"
}

variable "rds_security_group_id" {
  type        = string
  description = "The ID of the RDS Security Group"
}

variable "rds_subnet_group_id" {
  type        = string
  description = "The ID of the RDS Subnet Group"
}

