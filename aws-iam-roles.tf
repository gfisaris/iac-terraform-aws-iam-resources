resource "aws_iam_role" "ec2_instance" {
  name = "iam-role-ec2_inst-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
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

resource "aws_iam_role" "codedeploy" {
  name = "iam-role-dtcd-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
