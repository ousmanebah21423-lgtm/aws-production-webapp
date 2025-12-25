resource "aws_launch_template" "prod_lt" {
  name_prefix   = "prod-webapp-"
  image_id      = "ami-00e428798e77d38d9"  # Amazon Linux 2023 kernel-6.1
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.prod_sg.id]
  }

  key_name = "prod-webapp-ec2 key"
}

resource "aws_autoscaling_group" "prod_asg" {
  name                      = "prod-webapp-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  launch_template {
    id      = aws_launch_template.prod_lt.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.subnet_a.id, aws_subnet.subnet_c.id]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}
