resource "aws_iam_role" "ecsInstanceRole" {
  name = "ecs_cluster_ecsInstanceRole"
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

output "ecs_cluster_iamRole_ecsInstanceRole_arn"        {value ="${aws_iam_role.ecsInstanceRole.arn}"}
output "ecs_cluster_iamRole_ecsInstanceRole_unique_id"  {value = "${aws_iam_role.ecsInstanceRole.unique_id}"}

resource "aws_iam_role" "ecsServiceRole" {
  name = "ecs_cluster_ecsServiceRole"
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

output "ecs_cluster_iamRole_ecsServiceRole_arn"        {value ="${aws_iam_role.ecsServiceRole.arn}"}
output "ecs_cluster_iamRole_ecsServiceRole_unique_id"  {value = "${aws_iam_role.ecsServiceRole.unique_id}"}

resource "aws_iam_role" "ecsAutoscaleRole" {
  name = "ecs_cluster_ecsAutoscaleRole"
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

output "ecs_cluster_iamRole_ecsAutoscaleRole_arn"        {value ="${aws_iam_role.ecsAutoscaleRole.arn}"}
output "ecs_cluster_iamRole_ecsAutoscaleRole_unique_id"  {value = "${aws_iam_role.ecsAutoscaleRole.unique_id}"}

/*
resource "aws_iam_role" "ecsTaskRole" {
  name = "ecs_cluster_ecsTaskRole"
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

output "ecs_cluster_iamRole_ecsTaskRole_arn"        {value ="${aws_iam_role.ecsTaskRole.arn}"}
output "ecs_cluster_iamRole_ecsTaskRole_unique_id"  {value = "${aws_iam_role.ecsTaskRole.unique_id}"}
*/
