#Create ALB rules for 80

resource "aws_lb_listener_rule" "zupain" {
  listener_arn = "${var.listener_name}"
  priority     = "${var.rule_priority}"

  action {
    type             = "forward"
    target_group_arn = "${var.attach_targetgroup}"
  }

  condition {
    path_pattern {
      values = ["/api*"]
    }
  }

  condition {
    host_header {
      values = ["saikishore.com"]
    }
  }
}
