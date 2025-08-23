resource "aws_ecs_task_definition" "poll_task" {
  family                   = "poll-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "poll-app"
    image     = "123456789012.dkr.ecr.us-east-1.amazonaws.com/poll-app:latest"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}
