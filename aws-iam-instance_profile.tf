resource "aws_iam_instance_profile" "ecsInstanceRole" {
  name  = "ecs_cluster"
  roles = ["${aws_iam_role.ecsInstanceRole.id}"]
}

output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_id"          {value = "${aws_iam_instance_profile.ecsInstanceRole.id}"}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_arn"         {value = "${aws_iam_instance_profile.ecsInstanceRole.arn}"}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_name"        {value = "${aws_iam_instance_profile.ecsInstanceRole.name}"}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_path"        {value = "${aws_iam_instance_profile.ecsInstanceRole.path}"}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_roles"       {value = ["${aws_iam_instance_profile.ecsInstanceRole.roles}"]}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_unique_id"   {value = "${aws_iam_instance_profile.ecsInstanceRole.unique_id}"}
output "ecs_cluster_iamInstanceProfile_ecsInstanceRole_create_day"  {value = "${aws_iam_instance_profile.ecsInstanceRole.create_day}"}
