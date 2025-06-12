output "cluster_role_arn" {
  value       = aws_iam_role.cluster_role.arn
}

output "cluster_role_name" {
  value       = aws_iam_role.cluster_role.name
}

output "worker_node_role_arn" {
  value       = aws_iam_role.worker_node_role.arn
}

output "worker_node_role_name" {
  value       = aws_iam_role.worker_node_role.name
}