
# jenkins-target group 

resource "aws_lb_target_group" "jenkins_tg" {
  name        = "jenkins-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.sagar.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "jenkins-tg"
  }
}

resource "aws_lb_target_group_attachment" "jenkins_attachment" {
  target_group_arn = aws_lb_target_group.jenkins_tg.arn
  target_id        = aws_instance.jenkins.id
  port             = 8080
}

#node app target

resource "aws_lb_target_group" "node_tg" {
  name        = "nodejs-tg"
  port        = 8081
  protocol    = "HTTP"
  vpc_id      = aws_vpc.sagar.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "nodejs-tg"
  }
}

resource "aws_lb_target_group_attachment" "node_attachment" {
  target_group_arn = aws_lb_target_group.node_tg.arn
  target_id        = aws_instance.node.id
  port             = 8081
}

#vote app target group 
resource "aws_lb_target_group" "vote_tg" {
  name        = "vote-app-tg"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.sagar.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "vote-app-tg"
  }
}

resource "aws_lb_target_group_attachment" "vote_attachment" {
  target_group_arn = aws_lb_target_group.vote_tg.arn
  target_id        = aws_instance.vote.id
  port             = 5000
}

