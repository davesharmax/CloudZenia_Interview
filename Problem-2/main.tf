module "web_sg" {
  source = "./modules/security_group"
  name   = "web_sg"
}

module "web_instance" {
  source              = "./modules/ec2_instance"
  ami                 = "ami-0123456789abcdef0" # Replace with your chosen AMI
  instance_type      = "t2.micro"
  security_group_id  = module.web_sg.security_group_id
  instance_name      = "WebServer"
}
