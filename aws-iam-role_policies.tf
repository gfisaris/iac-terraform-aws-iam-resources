resource "aws_iam_role_policy" "AmazonEC2ContainerServiceforEC2Role" {
  name = "${data.terraform_remote_state.project.name}-AmazonEC2ContainerServiceforEC2Role"
  role = "${aws_iam_role.ecsInstanceRole.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "role_policy_AmazonEC2ContainerServiceforEC2Role_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceforEC2Role.id}"}
output "role_policy_AmazonEC2ContainerServiceforEC2Role_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceforEC2Role.name}"}
output "role_policy_AmazonEC2ContainerServiceforEC2Role_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceforEC2Role.role}"}
output "role_policy_AmazonEC2ContainerServiceforEC2Role_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceforEC2Role.policy}"}

resource "aws_iam_role_policy" "AmazonEC2ContainerServiceRole" {
  name = "${data.terraform_remote_state.project.name}-AmazonEC2ContainerServiceRole"
  role = "${aws_iam_role.ecsServiceRole.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "elasticloadbalancing:RegisterTargets"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "role_policy_AmazonEC2ContainerServiceRole_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceRole.id}"}
output "role_policy_AmazonEC2ContainerServiceRole_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceRole.name}"}
output "role_policy_AmazonEC2ContainerServiceRole_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceRole.role}"}
output "role_policy_AmazonEC2ContainerServiceRole_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceRole.policy}"}

resource "aws_iam_role_policy" "AmazonEC2ContainerServiceAutoscaleRole" {
  name = "${data.terraform_remote_state.project.name}-AmazonEC2ContainerServiceAutoscaleRole"
  role = "${aws_iam_role.ecsAutoscaleRole.id}"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1456535218000",
            "Effect": "Allow",
            "Action": [
                "ecs:DescribeServices",
                "ecs:UpdateService"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "Stmt1456535243000",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:DescribeAlarms"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

output "role_policy_AmazonEC2ContainerServiceAutoscaleRole_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceAutoscaleRole.id}"}
output "role_policy_AmazonEC2ContainerServiceAutoscaleRole_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceAutoscaleRole.name}"}
output "role_policy_AmazonEC2ContainerServiceAutoscaleRole_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceAutoscaleRole.role}"}
output "role_policy_AmazonEC2ContainerServiceAutoscaleRole_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceAutoscaleRole.policy}"}


resource "aws_iam_role_policy" "AmazonEC2ContainerService3ReadOnlyAccess" {
  name = "${data.terraform_remote_state.project.name}-AmazonEC2ContainerServiceS3ReadOnlyAccess"
  role = "${aws_iam_role.ecsInstanceRole.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "role_policy_AmazonEC2ContainerService3ReadOnlyAccess_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerService3ReadOnlyAccess.id}"}
output "role_policy_AmazonEC2ContainerService3ReadOnlyAccess_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerService3ReadOnlyAccess.name}"}
output "role_policy_AmazonEC2ContainerService3ReadOnlyAccess_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerService3ReadOnlyAccess.role}"}
output "role_policy_AmazonEC2ContainerService3ReadOnlyAccess_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerService3ReadOnlyAccess.policy}"}


// resource "aws_iam_role_policy" "AmazonEC2ContainerServiceFullAccess" {
//   name = "AmazonEC2ContainerServiceFullAccess"
//   role = ""
//   policy = <<EOF
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Action": [
//         "autoscaling:Describe*",
//         "autoscaling:UpdateAutoScalingGroup",
//         "cloudformation:CreateStack",
//         "cloudformation:DeleteStack",
//         "cloudformation:DescribeStack*",
//         "cloudformation:UpdateStack",
//         "cloudwatch:GetMetricStatistics",
//         "ec2:Describe*",
//         "elasticloadbalancing:*",
//         "ecs:*",
//         "iam:ListInstanceProfiles",
//         "iam:ListRoles",
//         "iam:PassRole"
//       ],
//       "Resource": "*"
//     }
//   ]
// }
// EOF
// }
//
// output "role_policy_AmazonEC2ContainerServiceFullAccess_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceFullAccess.id}"}
// output "role_policy_AmazonEC2ContainerServiceFullAccess_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceFullAccess.name}"}
// output "role_policy_AmazonEC2ContainerServiceFullAccess_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceFullAccess.role}"}
// output "role_policy_AmazonEC2ContainerServiceFullAccess_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceFullAccess.policy}"}
//
// resource "aws_iam_role_policy" "AmazonEC2ContainerServiceTaskRole" {
//   name = "${data.terraform_remote_state.project.name}-AmazonEC2ContainerServiceTaskRole"
//   role ="${aws_iam_role.ecsTaskRole.id}"
//   policy = <<EOF
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
// output "role_policy_AmazonEC2ContainerServiceTaskRole_id"     {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceTaskRole.id}"}
// output "role_policy_AmazonEC2ContainerServiceTaskRole_name"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceTaskRole.name}"}
// output "role_policy_AmazonEC2ContainerServiceTaskRole_role"   {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceTaskRole.role}"}
// output "role_policy_AmazonEC2ContainerServiceTaskRole_policy" {value = "${aws_iam_role_policy.AmazonEC2ContainerServiceTaskRole.policy}"}
