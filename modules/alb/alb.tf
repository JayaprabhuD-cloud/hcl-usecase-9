# Creating target group for flask application

resource "aws_lb_target_group" "flask_app_tg" {
  name = var.flasktg
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path     = "/health"
    protocol = "HTTP"
  }

  tags = {
    Name = var.flasktg
  }
}

# Creating Application Load Balancer

resource "aws_lb" "usecase9_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg
  subnets            = var.subnet_ids

  tags = {
    Name = var.alb_name
  }
}

# Creating listener for alb

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.usecase9_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Flask applications"
      status_code  = "404"
    }
  }
  tags = {
    Name = "usecase9_alb_listener"
  }
}

# Creating listener rule for patient service

resource "aws_lb_listener_rule" "flask" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.flask_app_tg.arn
  }

  condition {
    path_pattern {
      values = ["/flask*"]
    }
  }
  tags = {
    Name = "flask_listener_rule"
  }
}