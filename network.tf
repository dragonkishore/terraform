
module "vpc" {
        source          = "./modules/VPC"
        vpc_cidr        = "172.0.0.0/16"
        vpc_id          = "${module.vpc.vpc_id}"
        subnet_cidr_pub = ["172.0.1.0/24","172.0.2.0/24","172.0.3.0/24"]
        subnet_cidr_pri = ["172.0.4.0/24","172.0.5.0/24","172.0.6.0/24"]
}