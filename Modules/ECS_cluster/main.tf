resource "aws_ecs_cluster" "poll_cluster" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_capacity_provider" "ec2_provider" {
  name = "${var.cluster_name}-ec2"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 75
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 2
    }

    managed_termination_protection = "ENABLED"
  }
}

resource "aws_ecs_cluster_capacity_providers" "poll_cluster" {
  cluster_name       = aws_ecs_cluster.poll_cluster.name
  capacity_providers = [aws_ecs_capacity_provider.ec2_provider.name]

  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ec2_provider.name
    weight            = 1
  }
}
