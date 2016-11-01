resource "aws_iam_instance_profile" "node" {
  name  = "iam-instance_profile-${var.prj_ecosystem}-${var.prj_application}-${var.prj_environment}"
  roles = ["${aws_iam_role.ec2_instance.id}"]
}
