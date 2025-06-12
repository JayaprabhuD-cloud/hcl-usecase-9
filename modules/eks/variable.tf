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