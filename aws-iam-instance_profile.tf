resource "aws_iam_instance_profile" "ecs_container_host" {
  name  = "${var.prj_eco}-${var.prj_app}-${var.prj_env}"
  roles = ["${aws_iam_role.ecs_container_instance.id}"]
}
