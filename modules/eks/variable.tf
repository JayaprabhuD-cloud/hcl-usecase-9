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