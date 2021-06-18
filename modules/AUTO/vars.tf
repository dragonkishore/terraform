# data "aws_ami" "amazon_linux_ecs" {
#   most_recent = true

#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["ami-odbd*cf71"]
#   }

#   filter {
#     name   = "owner-alias"
#     values = ["amazon"]
#   }
# }
variable "asgname" {}
variable "asg_security_groups" {}
variable "ecs_instance_type" {}
variable "tagname" {}
variable "asg_vpc_zone_identifier" {}
variable "ecs_key_pair" {}
variable "ecs_volume_type" {}
variable "ecs_volume_size" {}
variable "asg_grp_name" {}
