
# module "vpc" {
#         source          = "../modules/VPC"
#         vpc_cidr        = "170.0.0.0/16"
#         vpc_id          = "${module.vpc.vpc_id}"
#         subnet_cidr_pub = ["170.0.1.0/24","170.0.2.0/24","170.0.3.0/24","170.0.4.0/24","170.0.5.0/24","170.0.6.0/24"]
#         subnet_cidr_pri = ["170.0.7.0/24","170.0.8.0/24","170.0.9.0/24","170.0.10.0/24","170.0.11.0/24","170.0.12.0/24"]
# }

# module "sg" {
#         source         = "../modules/SG"
#         sg_name        = "terraform"
#         sg_vpc_id      = "${module.vpc.vpc_id}"
# }

# module "sg1" {
#         source         = "../modules/SG"
#         sg_name        = "terraform1"
#         sg_vpc_id      = "${module.vpc.vpc_id}"
# }
 
# module "ec2" {
#         source                = "../modules/EC2"
#         ec2_count             = 1
#         ami_id                = "ami-0aeeebd8d2ab47354"
#         instance_type         = "t3.micro" 
#         ec2_security_groups   = "${module.sg.security_groups}"
#         ec2_subnet_ids        = "${module.vpc.subnet_id}"
#         ec2_key_pair          = "sai"
#         volume_size           = 8
#         volume_type           = "standard"
#         ec2_tagname           = "terraform"
# }
  
# module "alb" {
#         source              = "../modules/ALB"
#         alb_name            = "terraform"
#         alb_security_groups = "${module.sg.security_groups}"
#         alb_subnets         = "${module.vpc.subnet_id}"
# }

# module "df_targetgrp_grp" {
#         source             = "../modules/TAR_GRP"   
#         targetgrp_name     = "terraform"
#         trg_vpc_id         = "${module.vpc.vpc_id}"
# }

# module "alb_lis" {
#         source              = "../modules/ALB_LIS"
#         lis_alb_name        = "${module.alb.alb_name}"
#         attach_target_group = "${module.df_targetgrp_grp.aws_lb_target_group}"
# }

# module "target_grp1" {  
#         source             = "../modules/TAR_GRP"   
#         targetgrp_name     = "terraform1"
#         trg_vpc_id         = "${module.vpc.vpc_id}"
# }

# module "target_grp2" {  
#         source             = "../modules/TAR_GRP"   
#         targetgrp_name     = "terraform2"
#         trg_vpc_id         = "${module.vpc.vpc_id}"
# }

# module "alb_lis_rule1" {
#         source              = "../modules/ALB_LIS_RULE"
#         listener_name       = "${module.alb_lis.alb_listener}"
#         rule_priority       = 99
#         attach_targetgroup  = "${module.target_grp1.aws_lb_target_group}"
# }

# module "alb_lis_rule2" {
#         source              = "../modules/ALB_LIS_RULE"
#         listener_name       = "${module.alb_lis.alb_listener}"
#         rule_priority       = 100
#         attach_targetgroup  = "${module.target_grp2.aws_lb_target_group}"
# }
   
# module "ecr" {
#         source             = "../modules/ECR"
#         ecr_name           = "terraform"
# }

# module "ecs" {
#         source            = "../modules/ECS"
#         ecs_cluster_name  = "terraform"
# }
  
# module "ecs1" {
#         source            = "../modules/ECS_SER"
#         ecs_cluster_name  = "${module.ecs.clustername}" 
#         ecs_service_name  = "terraform1"
#         ecs_containername = "terraform1"
#         ecs_target_group  = "${module.target_grp1.aws_lb_target_group}"
#         ecs_containerport = 80
#         ecs_td_name       = "terraform1"
#         td_container_port = 80
# }

# module "ecs2" {
#        source            = "../modules/ECS_SER"
#        ecs_cluster_name  = "${module.ecs.clustername}"
#        ecs_service_name  = "terraform2"
#        ecs_containername = "terraform2"
#        ecs_target_group  = "${module.target_grp2.aws_lb_target_group}"
#        ecs_containerport = 3000
#        ecs_td_name       = "terraform2"
#        td_container_port = 3000
# } 

# module "cw_log_group" {
#        source            = "../modules/CW_LOG_GRP"
#        cw_log_group_name = "dev"
#        retention_in_days = 7
# }
 
# module "rds" {
#        source                      = "../modules/RDS"
#        rds_storage                 = 5
#        rds_storage_type            = "standard"
#        rds_engine_version          = "5.7.22"
#        rds_availability_zone       = "us-east-1a"
#        rds_instance_class          = "db.t3.micro"
#        rds_name                    = "terraform"
#        rds_username                = "root"
#        rds_password                = "123456789"
#        rds_parameter_group_name    = "default.mysql5.7"
#        rds_backup_window           = "09:46-10:16"
#        rds_backup_retention_period = 7
#        rds_deletion_protection     = "false"
#        rds_maintenance_window      = "Mon:00:00-Mon:01:00"
#        rds_port                    = 3306
#        rds_db_subnet_group_name    = "${module.vpc.db_subnet_group}"
#        rds_vpc_security_group_ids  = ["${module.sg.security_groups}","${module.sg1.security_groups}"]
#        rds_publicly_accessible     = "true"
#        rds_apply_immediately       = "true"
# }
#  module "asg" {
#        source                      = "../modules/AUTO"
#        asgname                     = "terraform"
#        asg_grp_name                = "zupain"
#        ecs_instance_type           = "t3.micro"
#        asg_security_groups         = "${module.sg.security_groups}"
#        asg_vpc_zone_identifier     = ["${module.vpc.subnet_id2}","${module.vpc.subnet_id3}"]
#        ecs_key_pair                = "sai"
#        ecs_volume_type             = "standard"
#        ecs_volume_size             = 30
#        tagname                     = "${module.ecs.clustername}"
# }
