resource "aws_iam_instance_profile" "ecsInstanceRole" {
  name  = "ecs_cluster"
  roles = ["${aws_iam_role.ecsInstanceRole.id}"]
}
