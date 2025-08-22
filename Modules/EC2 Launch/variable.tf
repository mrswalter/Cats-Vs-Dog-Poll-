variable "subnet_ids" {
  type = list(string)
}

variable "security_group" {
  type = string
}

variable "name_prefix" {
  type = string
  default = "ecs-ec2-"
}

variable "image_id" {
  type = string
  default = "ami-00ca32bbc84273381" # Amazon Linux 2 ECS Optimized
  
  }

variable "instance_type" {
  type = string
    default = "t3.micro"
}
#     = "ecs-ec2-"
#   image_id      = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 ECS Optimized
#   instance_type = "t3.micro"