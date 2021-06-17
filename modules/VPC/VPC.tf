#Create VPC

resource "aws_vpc" "terraform" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform"
  }
}

#Create Subnet

resource "aws_subnet" "terraform" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pub,count.index)}"

  tags = {
    Name = "terraform-pub-${count.index+1}"
  }
}

resource "aws_subnet" "terraform2" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pri,count.index)}"

  tags = {
    Name = "terraform-pri-${count.index+1}"
  }
}

#Creating RDS DB aws_db_subnet_group

resource "aws_db_subnet_group" "terraform" {
  name       = "terraform"
  subnet_ids = "${aws_subnet.terraform.*.id}"
}

#Create aws_internet_gateway
resource "aws_internet_gateway" "terraform" {
    
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "terraform"
  }
}

#Create elastic IP

resource "aws_eip" "terraform" {
  vpc      = true
}

#Create NAT Gateway

resource "aws_nat_gateway" "terraform" {
  allocation_id = aws_eip.terraform.id
  subnet_id     = "${aws_subnet.terraform[0].id}"

  tags = {
    Name = "terraform"
  }
}

#Create public Route Table

resource "aws_route_table" "terraform" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform.id
  }
  tags = {
    Name = "terraform"
  }
}

#Create private Route Table

resource "aws_route_table" "terraform1" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id= aws_nat_gateway.terraform.id
  }
  tags = {
    Name = "terraform-pri"
  }
}

#subet assoiciation with public route Table

resource "aws_route_table_association" "terraform" {

  count          = "${length(aws_subnet.terraform.*.id)}"
  subnet_id      = "${element(aws_subnet.terraform.*.id, count.index)}"
  route_table_id =  aws_route_table.terraform.id
}

#subet assoiciation with private route Table

resource "aws_route_table_association" "terraform1" {

  count          = "${length(aws_subnet.terraform2.*.id)}"
  subnet_id      = "${element(aws_subnet.terraform2.*.id, count.index)}"
  route_table_id =  aws_route_table.terraform1.id
}

output "vpc_id" {
  value = "${aws_vpc.terraform.id}"
}

output "subnet_id" {
  value = "${aws_subnet.terraform.*.id}"
}

output "subnet_id2" {
  value = "${aws_subnet.terraform[0].id}"
}  

output "subnet_id3" {
  value = "${aws_subnet.terraform[1].id}"
}

output "subnet_id_pri" {
  value = "${aws_subnet.terraform2.*.id}"
}

output "db_subnet_group" {
  value = "${aws_db_subnet_group.terraform.id}"
}