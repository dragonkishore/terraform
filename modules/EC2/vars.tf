
#Variables for EC2

variable "ec2_count" {}
variable "ami_id" {}
variable "instance_type" {}
variable "ec2_subnet_ids" {
  type = list
}
variable "ec2_security_groups" {}
variable "ec2_tagname" {}
variable "ec2_key_pair" {}
variable "volume_size" {}
variable "volume_type" {}


