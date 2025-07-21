output "route_table_id" {
  value       = aws_route_table.app_public_route_table.id
  description = "The ID of the Route Table"
}
