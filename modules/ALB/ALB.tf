#Create Application Load balancer

resource "aws_lb" "zupain" {
  name               = "${var.alb_name}"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["${var.alb_security_groups}"]
  subnets            = "${var.alb_subnets[*]}"
}

output "alb_name" {
  value = "${aws_lb.zupain.id}"
}
