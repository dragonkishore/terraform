#Create ECS Cluster

resource "aws_ecs_cluster" "zupain" {
  name = "${var.ecs_cluster_name}"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
output "clustername" {
  value = "${aws_ecs_cluster.zupain.name}"
}
