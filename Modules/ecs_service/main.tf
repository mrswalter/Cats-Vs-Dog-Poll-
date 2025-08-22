resource "aws_ecs_service" "poll_app" {
  name            = "poll-app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.poll_app.arn
  desired_count   = 1
  launch_type     = "EC2"

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.ecs_tasks.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.poll_app.arn
    container_name   = "poll-app"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.poll_app]
}
