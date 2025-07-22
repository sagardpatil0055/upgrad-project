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
  priority     = 105

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_tg.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins*", "/login*","/*"]
    }
  }
}

resource "aws_lb_listener_rule" "vote_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 102  # Make sure this is unique and lower number takes precedence

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

resource "aws_lb_listener_rule" "node_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 101  # Ensure this is unique and ordered

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.node_tg.arn
  }

  condition {
    path_pattern {
      values = ["/node*"]
    }
  }
}

resource "aws_lb_listener_rule" "result_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 103  # Ensure this is unique

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.result_tg.arn
  }

  condition {
    path_pattern {
      values = ["/result*"]
    }
  }
}

