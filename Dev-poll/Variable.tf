variable "region" {
  type = string
  default = "us-east-1"
  
}

variable "app_image" {
  description = "Docker image for the poll app"
  type        = string
}

