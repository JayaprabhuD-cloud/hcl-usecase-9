output "flask_repo_url" {
  value = aws_ecr_repository.flask_application.repository_url
}

output "flask_repo_arn" {
  value = aws_ecr_repository.flask_application.arn
}