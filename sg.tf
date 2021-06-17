module "sg" {
        source         = "./modules/SG"
        sg_name        = "terraform"
        sg_vpc_id      = "${module.vpc.vpc_id}"
}