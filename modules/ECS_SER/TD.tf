resource "aws_ecs_task_definition" "zupain" {
  family = "${var.ecs_td_name}"
  #execution_role_arn = ""
  container_definitions = jsonencode([
    {
      name      = "${var.ecs_td_name}"
      image     = "nginx"
      cpu       = 100
      memory    = 100
      essential = true
      portMappings = [
        {
          containerPort = "${var.td_container_port}"
          hostPort      = 0
        }
      ]
    }
  ])
}


