resource "aws_launch_configuration" "zupain" {
  name_prefix       = "${var.asgname}"
  image_id          = "ami-0dbd8c88f9060cf71"
  instance_type     = "${var.ecs_instance_type}"
  iam_instance_profile = "arn:aws:iam::390161664430:instance-profile/ecsInstanceRole"
  key_name          = "${var.ecs_key_pair}"
  user_data         = "#!/bin/bash\necho ECS_CLUSTER= terraform >> /etc/ecs/ecs.config;\necho ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;"
  security_groups   = ["${var.asg_security_groups}"]
  associate_public_ip_address  = "true"
  enable_monitoring = "true"
  ebs_optimized     = "true"
  root_block_device  {
        volume_type = "${var.ecs_volume_type}"
        volume_size = "${var.ecs_volume_size}"
   }
 }

resource "aws_autoscaling_group" "zupain" {
  name                 = "${var.asg_grp_name}"
  vpc_zone_identifier  = "${var.asg_vpc_zone_identifier}"
  launch_configuration = aws_launch_configuration.zupain.name
  desired_capacity     = 1
  min_size             = 1
  max_size             = 1
  health_check_type    = "EC2"

  tag {
    key                 = "Name"
    value               = "${var.asgname}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.tagname}"
    propagate_at_launch = true
  }
}