resource "aws_iam_user" "demo_user" {
  name = var.iam_username
}

resource "aws_iam_group" "devops_group" {
  name = "DevOps-Freshers"
}

resource "aws_iam_user_membership" "demo_membership" {
  name = "demo-membership"
  
  users = [
    aws_iam_user.demo_user.name
  ]
  
  group = aws_iam_group.devops_group.name
}

resource "aws_iam_policy" "ec2_read_policy" {
  name        = "EC2ReadOnlyPolicy"
  description = "Read-only access to EC2 for freshers"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["ec2:Describe*"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "demo_policy_attach" {
  group      = aws_iam_group.devops_group.name
  policy_arn = aws_iam_policy.ec2_read_policy.arn
}
