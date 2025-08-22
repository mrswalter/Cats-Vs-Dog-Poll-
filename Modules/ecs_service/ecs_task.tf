variable "app_image" {
  description = "Docker image for the poll app"
  type        = string
}

resource "aws_ecs_task_definition" "poll_app" {
  family                   = "poll-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"] # since we removed Fargate
  cpu                      = "256"
  memory                   = "512"

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
