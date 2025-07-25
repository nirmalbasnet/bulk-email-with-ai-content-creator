resource "aws_subnet" "bulk_email_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = "${var.project_name}"
  }
}
