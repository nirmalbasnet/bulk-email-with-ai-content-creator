output "ec2_security_group_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ID of the EC2 Security Group"
}
