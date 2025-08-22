resource "aws_launch_configuration" "ecs" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id # Amazon Linux 2 ECS Optimized
  instance_type = var.instance_type
  security_groups = [var.security_group]

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=poll-cluster >> /etc/ecs/ecs.config
EOF
}

resource "aws_autoscaling_group" "ecs" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  launch_configuration = aws_launch_configuration.ecs.id
  vpc_zone_identifier  = var.subnet_ids

  # tags = [
  #   {
  #     key                 = "Name"
  #     value               = "ecs-ec2-instance"
  #     propagate_at_launch = true
  #   }
  # ]
}
output "security_group" {
  value = aws_launch_configuration.ecs.security_groups[0]
}