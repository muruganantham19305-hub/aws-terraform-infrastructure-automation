output "iam_user_name" {
  description = "Name of created IAM user"
  value       = aws_iam_user.fresher_user.name
}

output "group_name" {
  description = "DevOps group name"
  value       = aws_iam_group.devops_team.name
}

