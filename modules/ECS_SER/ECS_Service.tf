resource "aws_ecs_service" "zupain" {
  name            = "${var.ecs_service_name}"
  cluster         = "${var.ecs_cluster_name}"
  task_definition = "${aws_ecs_task_definition.zupain.arn}"
  desired_count   = 1
  ordered_placement_strategy {
  type = "spread"
  field = "attribute:ecs.availability-zone"
  }

load_balancer {
    target_group_arn = "${var.ecs_target_group}"
    container_name   = "${var.ecs_containername}"
    container_port   = "${var.ecs_containerport}"
  }
}

