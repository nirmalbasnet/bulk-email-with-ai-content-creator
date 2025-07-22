output "rds_subnet_group_id" {
  value       = aws_db_subnet_group.rds_subnet_group.id
  description = "The ID of the RDS Subnet Group"
}
