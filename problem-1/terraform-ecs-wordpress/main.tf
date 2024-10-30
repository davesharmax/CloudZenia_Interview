provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

module "vpc" {
  source  = "./vpc"
}

module "ecs_cluster" {
  source       = "./ecs"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets
  alb_subnets  = module.vpc.public_subnets
}

module "rds" {
  source       = "./rds"
  db_subnets   = module.vpc.private_subnets
  vpc_id       = module.vpc.vpc_id
}

module "alb" {
  source       = "./alb"
  vpc_id       = module.vpc.vpc_id
  alb_subnets  = module.vpc.public_subnets
  ecs_service  = module.ecs_cluster.ecs_service
  certificate_arn = data.aws_acm_certificate.cert.arn
}
