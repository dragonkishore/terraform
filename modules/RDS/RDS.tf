#Creating var.rds DB Instance

resource "aws_db_instance" "zupain" {
  allocated_storage       = "${var.rds_storage}"
  storage_type            = "${var.rds_storage_type}"
  engine                  = "mysql"
  engine_version          = "${var.rds_engine_version}"
  availability_zone       = "${var.rds_availability_zone}"
  instance_class          = "${var.rds_instance_class}"
  name                    = "${var.rds_name}"
  username                = "${var.rds_username}"
  password                = "${var.rds_password}"
  parameter_group_name    = "${var.rds_parameter_group_name}"
  backup_window           = "${var.rds_backup_window}"
  backup_retention_period = "${var.rds_backup_retention_period}"
  deletion_protection     = "${var.rds_deletion_protection}"
  maintenance_window      = "${var.rds_maintenance_window}"
  port                    = "${var.rds_port}"
  publicly_accessible     = "${var.rds_publicly_accessible}"
  db_subnet_group_name    = "${var.rds_db_subnet_group_name}"
  vpc_security_group_ids  = "${var.rds_vpc_security_group_ids}"
  apply_immediately       = "${var.rds_apply_immediately}"
  skip_final_snapshot     = true
}
