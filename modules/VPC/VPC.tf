#Create VPC

resource "aws_vpc" "zupain" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "zupain"
  }
}

#Create Subnet

resource "aws_subnet" "zupain_pub" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pub,count.index)}"

  tags = {
    Name = "zupain-pub-${count.index+1}"
  }
}

resource "aws_subnet" "zupain_pri" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pri,count.index)}"

  tags = {
    Name = "zupain-pri-${count.index+1}"
  }
}

#Creating RDS DB aws_db_subnet_group

resource "aws_db_subnet_group" "zupain" {
  name       = "zupain"
  subnet_ids = "${aws_subnet.zupain_pri.*.id}"
}

#Create aws_internet_gateway
resource "aws_internet_gateway" "zupain" {
    
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "zupain"
  }
}

#Create elastic IP

resource "aws_eip" "zupain" {
  vpc      = true
}

#Create NAT Gateway

resource "aws_nat_gateway" "zupain" {
  allocation_id = aws_eip.zupain.id
  subnet_id     = "${aws_subnet.zupain_pub[0].id}"

  tags = {
    Name = "zupain"
  }
}

#Create public Route Table

resource "aws_route_table" "zupain_pub" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zupain.id
  }
  tags = {
    Name = "zupain-pub"
  }
}

#Create private Route Table

resource "aws_route_table" "zupain_pri" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id= aws_nat_gateway.zupain.id
  }
  tags = {
    Name = "zupain-pri"
  }
}

#subet assoiciation with public route Table

resource "aws_route_table_association" "zupain_pub" {

  count          = "${length(aws_subnet.zupain_pub.*.id)}"
  subnet_id      = "${element(aws_subnet.zupain_pub.*.id, count.index)}"
  route_table_id =  aws_route_table.zupain_pub.id
}

#subet assoiciation with private route Table

resource "aws_route_table_association" "zupain_pri" {

  count          = "${length(aws_subnet.zupain_pri.*.id)}"
  subnet_id      = "${element(aws_subnet.zupain_pri.*.id, count.index)}"
  route_table_id =  aws_route_table.zupain_pri.id
}

output "vpc_id" {
  value = "${aws_vpc.zupain.id}"
}

output "subnet_id" {
  value = "${aws_subnet.zupain_pub.*.id}"
}

output "subnet_id2" {
  value = "${aws_subnet.zupain_pub[0].id}"
}  

output "subnet_id3" {
  value = "${aws_subnet.zupain_pub[1].id}"
}

output "subnet_id_pri" {
  value = "${aws_subnet.zupain_pri.*.id}"
}

output "db_subnet_group" {
  value = "${aws_db_subnet_group.terraform.id}"
}