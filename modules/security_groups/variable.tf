variable "vpc_id" {
  description = "vpc for our application"
  type = string
}

variable "alb_sg_name" {
  description = "sg for alb"
  type = string
}

variable "app_sg_name" {
  description = "sg for application containers"
  type = string
}

