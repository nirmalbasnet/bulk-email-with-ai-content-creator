output "rds_security_group_id" {
  value       = aws_security_group.rds_sg.id
  description = "The ID of the RDS Security Group"
}
