resource "aws_dynamodb_table" "my_table" {

  name         = "cars"
  hash_key     = "VIN"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }
}
resource "aws_dynamodb_table_item" "firs_item" {
  table_name = aws_dynamodb_table.my_table.name
  hash_key   = aws_dynamodb_table.my_table.hash_key
  item       = <<EOF
    {
        "Manufacturer": {"S":"Toyota"},
        "VIN": {"S":"56864O"},
        "Model": {"N":"2004"}
    }
  EOF
}