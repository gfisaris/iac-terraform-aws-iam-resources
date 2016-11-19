resource "aws_iam_role" "ecsInstanceRole" {
  name = "${data.terraform_remote_state.project.name}-ecsInstanceRole"
  path = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

output "role_ecsInstanceRole_arn"        {value ="${aws_iam_role.ecsInstanceRole.arn}"}
output "role_ecsInstanceRole_unique_id"  {value = "${aws_iam_role.ecsInstanceRole.unique_id}"}

resource "aws_iam_role" "ecsServiceRole" {
  name = "${data.terraform_remote_state.project.name}-ecsServiceRole"
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

output "role_ecsServiceRole_arn"        {value ="${aws_iam_role.ecsServiceRole.arn}"}
output "role_ecsServiceRole_unique_id"  {value = "${aws_iam_role.ecsServiceRole.unique_id}"}

resource "aws_iam_role" "ecsAutoscaleRole" {
  name = "${data.terraform_remote_state.project.name}-ecsAutoscaleRole"
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "application-autoscaling.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

output "role_ecsAutoscaleRole_arn"        {value ="${aws_iam_role.ecsAutoscaleRole.arn}"}
output "role_ecsAutoscaleRole_unique_id"  {value = "${aws_iam_role.ecsAutoscaleRole.unique_id}"}

// resource "aws_iam_role" "ecsTaskRole" {
//   name = "${data.terraform_remote_state.project.name}-ecsTaskRole"
//   path = "/"
//   assume_role_policy = <<EOF
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Sid": "",
//       "Effect": "Allow",
//       "Principal": {
//         "Service": "ecs-tasks.amazonaws.com"
//       },
//       "Action": "sts:AssumeRole"
//     }
//   ]
// }
// EOF
// }
//
// output "role_ecsTaskRole_arn"        {value ="${aws_iam_role.ecsTaskRole.arn}"}
// output "role_ecsTaskRole_unique_id"  {value = "${aws_iam_role.ecsTaskRole.unique_id}"}
