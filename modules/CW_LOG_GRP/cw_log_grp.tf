resource "aws_cloudwatch_log_group" "zupain" {
  name              = "${var.cw_log_group_name}"
  retention_in_days = "${var.retention_in_days}"

}