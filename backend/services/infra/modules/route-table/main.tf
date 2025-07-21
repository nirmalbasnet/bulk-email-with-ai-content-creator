resource "aws_route_table" "app_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" #Puclic internet
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "${var.project_name}"
  }
}
