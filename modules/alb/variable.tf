variable "flask_app_tg" {
  description = "flask application target group name"
  type = string
  default = "flask_app_tg"
}

variable "vpc_id" {
  description = "refering vpc"
  type = string
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "alb_sg" {
  description = "Security group ID for the ALB"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}