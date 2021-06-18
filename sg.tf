module "sg" {
        source               = "./modules/SG"
        sg_name              = "terraform"
        sg_vpc_id            = "${module.vpc.vpc_id}"
}

module "sg_rule1" {
        sg_ruletype          = "ingress"
        sg_from_port         = 0
        sg_to_port           = 0
        sg_protocoltype      = "-1"
        sg_cidr_blocks       = ["0.0.0.0/0"] 
        sg_ipv6_cidr_blocks  = ["::/0"]
        sg_group_id          = "${module.sg.security_groups}"
}

module "sg_rule2" {
        sg_ruletype          = "egress"
        sg_from_port         = 0
        sg_to_port           = 0
        sg_protocoltype      = "-1"
        sg_cidr_blocks       = ["0.0.0.0/0"] 
        sg_ipv6_cidr_blocks  = ["::/0"]
        sg_group_id          = "${module.sg.security_groups}"
}