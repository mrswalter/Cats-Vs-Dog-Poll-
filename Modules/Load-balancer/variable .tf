variable "vpc_cidr" {
  type    = string
  default = ""
  }

variable "cidr_block" {
    type    = string
    default = "10.0.0.0/16"
}           

variable "tag_name" {
  type    = string
  default = "poll-vpc"
  }






  

# variable "availability_zones" {
#   type = list(string)
#     default = [us-east-1a, us-east-1b]
#     }