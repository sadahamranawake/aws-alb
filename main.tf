
resource "aws_lb" "AlbInternetFacing" {
  name               = var.AlbName
  internal           = var.IsInternal
  load_balancer_type = "application"
  security_groups    = var.SecurityGroups
  subnets            = var.SubnetIds

  enable_deletion_protection = var.EnableDeleteProtection

  tags = {
    visibility = "internet-facing"
  }

  lifecycle {
    ignore_changes = [security_groups, tags ]
  }
}

resource "aws_alb_listener" "HttpListener" {
  load_balancer_arn = aws_lb.AlbInternetFacing.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "HttpsListener" {
  load_balancer_arn = aws_lb.AlbInternetFacing.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificateArn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Invalid"
      status_code  = "404"
    }
  }
}