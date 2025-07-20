resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.sagar_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Default response on 8080"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener_rule" "jenkins_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_tg.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins*", "/login*"]
    }
  }
}

resource "aws_lb_listener_rule" "vote_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 101  # Make sure this is unique and lower number takes precedence

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vote_tg.arn
  }

  condition {
    path_pattern {
      values = ["/vote*"]
    }
  }
}
