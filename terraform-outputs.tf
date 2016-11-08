output "iamRole_ecsContainerInstanceRole" {
  value = "${aws_iam_role.ecs_container_instance.id}"
}

output "iamRole_ecsServiceSchedulerRole"{
  value = "${aws_iam_role.ecs_service_scheduler.id}"
}

output "iamRole_ecsServiceAutoScalingRole"{
  value = "${aws_iam_role.ecs_service_autoscaling.id}"
}

output "iamRole_ecsContainerServiceTaskRole"{
  value = "${aws_iam_role.ec2_container_service_task.id}"
}

output "IamRole_ecsContainerInstanceProfile" {
  value = "${aws_iam_instance_profile.ecs_container_host.name}"
}
