resource "aws_vpc" "bulk_email_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "${var.project_name}"
  }
}
