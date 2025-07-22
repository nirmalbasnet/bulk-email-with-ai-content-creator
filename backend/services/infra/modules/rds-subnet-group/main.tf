resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.project_name
  subnet_ids = [var.private_subnet_id_1, var.private_subnet_id_2]

  tags = {
    Name = "${var.project_name}"
  }
}
