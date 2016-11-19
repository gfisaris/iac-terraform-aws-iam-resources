resource "aws_iam_instance_profile" "ecsInstanceProfile" {
  name  = "${data.terraform_remote_state.project.name}-ecsInstanceProfile"
  roles = ["${aws_iam_role.ecsInstanceRole.id}"]
}

output "instance_profile_ecsInstanceProfile_id"          {value = "${aws_iam_instance_profile.ecsInstanceProfile.id}"}
output "instance_profile_ecsInstanceProfile_arn"         {value = "${aws_iam_instance_profile.ecsInstanceProfile.arn}"}
output "instance_profile_ecsInstanceProfile_name"        {value = "${aws_iam_instance_profile.ecsInstanceProfile.name}"}
output "instance_profile_ecsInstanceProfile_path"        {value = "${aws_iam_instance_profile.ecsInstanceProfile.path}"}
output "instance_profile_ecsInstanceProfile_roles"       {value = ["${aws_iam_instance_profile.ecsInstanceProfile.roles}"]}
output "instance_profile_ecsInstanceProfile_unique_id"   {value = "${aws_iam_instance_profile.ecsInstanceProfile.unique_id}"}
output "instance_profile_ecsInstanceProfile_create_day"  {value = "${aws_iam_instance_profile.ecsInstanceProfile.create_day}"}
