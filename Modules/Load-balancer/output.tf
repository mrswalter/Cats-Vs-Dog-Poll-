# Outputs
output "alb_dns" {
  value = aws_lb.poll_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.poll_tg.arn
}

output "subnet_ids" {
  value = aws_subnet.poll_subnet[*].id
}

output "security_group" {
  value = aws_security_group.alb_sg.id
}
