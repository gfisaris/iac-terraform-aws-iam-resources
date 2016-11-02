resource "aws_iam_instance_profile" "ecs_container_host" {
  name  = "${var.prj_eco}-${var.prj_app}-${var.prj_env}-ecs_container_instance_profile"
  roles = ["${aws_iam_role.ecs_container_instance.id}"]
}
