
#Create Security Group

resource "aws_security_group_rule" "zupain" {
  type              = "${var.sg_ruletype}"
  from_port         = "${var.sg_from_port}"
  to_port           = "${var.sg_to_port}"
  protocol          = "${var.sg_protocoltype}"
  cidr_blocks       = "${var.sg_cidr_block}"
  ipv6_cidr_blocks  = "${var.sg_ipv6_cidr_block}"
  security_group_id = "${var.sg_group_id}"
}
  