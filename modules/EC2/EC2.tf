resource "aws_instance" "zupain" {
  count                       = "${var.ec2_count}"
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  monitoring                  = false  
  security_groups             = ["${var.ec2_security_groups}"]
  subnet_id                   = "${var.ec2_subnet_ids[5]}"
  associate_public_ip_address = "true"
  key_name                    = "${var.ec2_key_pair}"
  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "${var.volume_type}"
  }
 
  tags = {
    Name = "${var.ec2_tagname}"
  }
}