output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.usecase9_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.usecase9_alb.arn
}

output "target_group_arns" {
  description = "Flask target groups"
  value = aws_lb_target_group.flask_app_tg.arn
}

output "listener_arn" {
  value       = aws_lb_listener.http.arn
}