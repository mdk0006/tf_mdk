resource "aws_iam_user" "admin" {
  name = "Dani2"
  tags = {
    "Role"      = "Admin"
    Description = "Tech Lead"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
resource "aws_iam_policy" "for_admin" {
  name   = "AdminUser"
  policy = file("./adminpolicy.json")
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
resource "aws_iam_user_policy_attachment" "admin_users" {
  user       = aws_iam_user.admin.name
  policy_arn = aws_iam_policy.for_admin.arn
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.admin.name
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}