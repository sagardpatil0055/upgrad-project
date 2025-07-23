resource "aws_iam_instance_profile" "ec2readonly_profile" {
  name = "ec2readonly-profile"
  role = "ec2readonly" # Pre-existing IAM role
}
