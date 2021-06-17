
#variables for RDS

variable "rds_name" {}
variable "rds_engine_version" {}
variable "rds_availability_zone" {}
variable "rds_instance_class" {}
variable "rds_username" {}
variable "rds_password" {}
variable "rds_parameter_group_name" {}
variable "rds_backup_window" {}
variable "rds_backup_retention_period" {}
variable "rds_deletion_protection" {}
variable "rds_maintenance_window" {}
variable "rds_port" {}
variable "rds_publicly_accessible" {}
variable "rds_apply_immediately" {}
variable "rds_storage" {}
variable "rds_storage_type" {}
variable "rds_db_subnet_group_name" {}
variable "rds_vpc_security_group_ids" {
    type = list
}

