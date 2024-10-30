output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.wordpress_alb.dns_name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.wordpress_service.name
}
