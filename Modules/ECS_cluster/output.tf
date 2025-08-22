output "cluster_id" {
  value = aws_ecs_cluster.poll_cluster.id
}

output "cluster_name" {
  value = aws_ecs_cluster.poll_cluster.name
}
output "ec2_capacity_provider_name" {
  value = aws_ecs_capacity_provider.ec2_provider.name
}