#Create ALB Listeners 80

resource "aws_lb_listener" "zupain" {
  load_balancer_arn = "${var.lis_alb_name}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type                 = "forward"
    target_group_arn     = "${var.attach_target_group}"
  }
}

output "alb_listener" {
   value = "${aws_lb_listener.zupain.id}"
  }


