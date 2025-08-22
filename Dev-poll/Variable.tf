#variable "region" {
 # type = string
  #default = "us-east-1"
  
#}

variable "app_image" {
  description = "Docker image to deploy for the app"
  type        = string
  default     = ""
}

