variable "cluster_name" {
    type = string
    description = "name of the ecs cluster"
    default = "ecs-cluster"
}
variable "alb_target_arn" {
    type = string
    description = "arn of the alb target group"
    default = "value"
}
variable "subnet_ids" {
    type = list(string)
    description = "list of subnet ids"
    default = []
}
variable "security_group" {
    type = string
    description = "security group id"
    default = ""
}
variable "app_image" {
    type = string
    description = "docker image for the application"
    default = "values.dockerhub.com/nginxdemos/hello"
}