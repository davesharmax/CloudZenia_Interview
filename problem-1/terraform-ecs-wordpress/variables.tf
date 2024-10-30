variable "db_username" {
  type = string
  description = "Database master username"
}

variable "db_password" {
  type = string
  description = "Database master password"
  sensitive = true
}

variable "domain_name" {
  type = string
  description = "Domain name for ALB SSL"
  default = "ecs.divyank.xyz"
}

variable "vpc_id" {
  description = "VPC ID for ECS and ALB"
  type = string
}

variable "private_subnets" {
  description = "Private subnets for ECS and RDS"
  type = list(string)
}

variable "alb_subnets" {
  description = "Public subnets for ALB"
  type = list(string)
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type = string
}
