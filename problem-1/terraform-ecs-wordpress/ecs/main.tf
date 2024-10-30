resource "aws_ecs_cluster" "wordpress_cluster" {
  name = "ecs-wordpress-cluster"
}

resource "aws_ecs_task_definition" "wordpress_task" {
  family                   = "wordpress-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name = "wordpress"
      image = "wordpress"
      portMappings = [{ containerPort = 80, hostPort = 80 }]
      environment = [
        { name = "WORDPRESS_DB_HOST", value = aws_db_instance.wordpress_db.endpoint },
        { name = "WORDPRESS_DB_USER", valueFrom = aws_secretsmanager_secret_version.db_credentials.secret_string }
      ]
    }
  ])
}

resource "aws_ecs_service" "wordpress_service" {
  name            = "wordpress-service"
  cluster         = aws_ecs_cluster.wordpress_cluster.id
  task_definition = aws_ecs_task_definition.wordpress_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [aws_security_group.ecs_service_sg.id]
  }
}
