resource "aws_ecs_task_definition" "poll_app" {
  family                   = "poll-app"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]

container_definitions = jsonencode([
    {
      name      = "poll-app"
      image     = var.app_image
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}


resource "aws_ecs_service" "poll_service" {
  name            = "poll-service"
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.poll_app.arn
  desired_count   = 2
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = var.alb_target_arn
    container_name   = "poll-app"
    container_port   = 5000
  }

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  depends_on = [aws_lb_listener.poll_listener]
}

