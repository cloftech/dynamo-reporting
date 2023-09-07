resource "aws_dynamodb_table" "table" {
  for_each     = toset(var.name)
  name         = "${var.project_name}-${var.environment_name}-${each.key}-dynamodb-table"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = var.hash_key
    type = "S"
  }
}