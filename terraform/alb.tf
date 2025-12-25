resource "aws_lb" "prod_alb" {
  name               = "prod-webapp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_c.id]
}

resource "aws_lb_target_group" "prod_tg" {
  name     = "prod-webapp-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prod_vpc.id
}

resource "aws_lb_listener" "prod_listener" {
  load_balancer_arn = aws_lb.prod_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod_tg.arn
  }
}
