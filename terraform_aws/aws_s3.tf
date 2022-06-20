# Creating S3 BUCKET 
resource "aws_s3_bucket" "my_s3" {
  bucket = "dani-finance-2948"
  tags = {
    "Env"       = "Production"
    Description = "For Financing Purposes"
  }
  lifecycle {
    ignore_changes = all
  }

}
# Testing that s3 can be made from giving no attribute
resource "aws_s3_bucket" "random_s3" {
  lifecycle {

    ignore_changes = all
  }

}
# This is for the s3 object which is to be stored
resource "aws_s3_object" "for_random_s3" {
  content = file("./adminpolicy.json")
  key     = "my-doc"
  bucket  = aws_s3_bucket.my_s3.id
  lifecycle {
    ignore_changes = all
  }

}
# For getting the arn of the admin group so we can make the bucket policy
data "aws_iam_user" "admin_group" {
  user_name = "Dani2"
}
resource "aws_s3_bucket_policy" "for_admin" {
  bucket = aws_s3_bucket.my_s3.id
  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "*",
                "Effect": "Allow",
                "Resource": "arn:aws:s3:::${aws_s3_bucket.my_s3.id}/*",
                "Principal": {
                    "AWS": [
                        "${data.aws_iam_user.admin_group.arn}"
                    ]
                }
            }
        ]
    }
    EOF
  lifecycle {
    ignore_changes = all
  }
}

