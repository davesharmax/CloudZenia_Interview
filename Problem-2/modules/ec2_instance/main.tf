resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type         = var.instance_type
  security_groups       = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }
}
