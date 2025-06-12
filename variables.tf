variable "vpc_cidr_block" {
  description = "vpc cidr value"
  type = string
}

variable "public_subnet_1_cidr" {
  description = "public subnet 1 cidr value"
  type = string
}

variable "public_subnet_2_cidr" {
  description = "public subnet 2 cidr value"
  type = string 
}

variable "private_subnet_1_cidr" {
  description = "private subnet 1 cidr value"
  type = string
}
variable "private_subnet_2_cidr" {
  description = "private subnet 2 cidr value"
  type = string
}

variable "repo_name_1" {
  description = "Variable created for patient ecr repo"
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

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "eks_cluster_role_name" {
  description = "eks cluster role name"
  type = string
  default = "eks_cluster_role"
}


variable "eks_worker_node_role_name" {
  description = "eks worker node role name"
  type = string
  default = "eks_worker_node_role"
}

variable "flasktg" {
  description = "flask application target group name"
  type = string
  default = "flasktg"
}

variable "eks_cluster_name" {
  description = " EKS cluster name"
  type = string
  default = "usecase9-batch5-eks-cluster"
}

variable "node_group_name" {
  description = " EKS node group name"
  type = string
  default = "usecase9-worker-nodes"
}