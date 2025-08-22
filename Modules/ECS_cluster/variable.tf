variable "cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
  default     = "poll-app-cluster"
}

variable "instance_type" {
  description = "EC2 instance type for ECS cluster"
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  description = "Number of EC2 instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Max size of ASG"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "Min size of ASG"
  type        = number
  default     = 1
}

variable "key_name" {
  description = "EC2 Key Pair for SSH access"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
  default     = []
}