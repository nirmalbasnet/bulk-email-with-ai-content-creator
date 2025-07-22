resource "aws_instance" "bulk_email_ec2_instance" {
  ami             = data.aws_ssm_parameter.amazon_linux_ami_id.value
  instance_type   = var.ec2_instance_type
  subnet_id       = var.ec2_instance_subnet_id
  key_name        = var.ec2_instance_key_pair
  security_groups = [var.ec2_security_group_id] # reference to the EC2 security group module

  tags = {
    Name = "${var.project_name}"
  }
}
