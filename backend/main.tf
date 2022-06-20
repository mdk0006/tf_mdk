resource "aws_s3_bucket" "tf" {
  bucket = "terraform-dani-state-locking"
  lifecycle {
    ignore_changes  = all
    prevent_destroy = true
  }


}
resource "aws_s3_object" "tf" {
  bucket = aws_s3_bucket.tf.id
  key    = "dani/terraform.tfstate"
  lifecycle {
    ignore_changes  = all
    prevent_destroy = true
  }

}

resource "aws_dynamodb_table" "db" {
  name         = "state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
