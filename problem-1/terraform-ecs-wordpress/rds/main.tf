resource "aws_db_instance" "wordpress_db" {
  identifier         = "wordpress-db"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.wordpress_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

resource "aws_db_subnet_group" "wordpress_subnets" {
  name       = "wordpress-db-subnets"
  subnet_ids = var.db_subnets
}
