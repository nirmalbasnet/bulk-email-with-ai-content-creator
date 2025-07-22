resource "aws_db_instance" "bulk_email_rds_instance" {
  engine                      = var.rds_db_engine
  engine_version              = var.rds_db_engine_version
  instance_class              = var.rds_db_instance_class
  allocated_storage           = var.rds_db_allocated_storage
  db_name                     = var.rds_db_db_name
  username                    = var.rds_db_username
  manage_master_user_password = var.manage_master_user_password
  skip_final_snapshot         = var.rds_db_skip_final_snapshot
  publicly_accessible         = var.rds_db_publicly_accessible
  multi_az                    = var.rds_db_multi_az
  backup_retention_period     = var.rds_db_backup_retention_period
  identifier                  = var.project_name
  db_subnet_group_name        = var.rds_subnet_group_id
  vpc_security_group_ids      = [var.rds_security_group_id] # reference to the RDS security group module

  tags = {
    Name = "${var.project_name}"
  }
}
