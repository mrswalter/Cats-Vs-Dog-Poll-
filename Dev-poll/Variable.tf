variable "app_image" {
  type = string
  description = "Docker image URI for the Poll app" #"values.dockerhub.com/nginxdemos/hello"
}

variable "region" {
  type = string
  default = "us-east-1"
  
}

variable "app_image" {
  description = "Docker image for the poll app"
  type        = string
}

