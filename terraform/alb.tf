resource "aws_lb" "sagar_alb" {
  name               = "sagar-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public[0].id, aws_subnet.public[1].id]
  tags = {
    Name = "sagar-alb"
  }
}
