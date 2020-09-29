resource "aws_iam_group" "administrators" {
  name = "administrators"
}
resource "aws_iam_policy_attachment" "administrators-attach" {
  name       = "administrators-attach"
  groups     = [aws_iam_group.administrators.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_user" "buruga1" {
  name = "buruga1"
}
resource "aws_iam_user" "buruga2" {
  name = "buruga2"
}
resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  users = [
    aws_iam_user.buruga1.name,
    aws_iam_user.buruga2.name,
  ]
  group = aws_iam_group.administrators.name
}