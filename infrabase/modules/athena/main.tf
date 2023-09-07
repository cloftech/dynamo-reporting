resource "aws_athena_data_catalog" "dynamodb" {
  name        = "${var.project_name}-${var.environment_name}-athena-dynamodb-catalog"
  description = "Example Athena Dynamodb data catalog"
  type        = var.type

  parameters = {
    "function" = aws_lambda_function.ConnectorConfig.arn
  }

  tags = {
    Name = "${var.project_name}-${var.environment_name}athena-dynamodb-catalog"
  }
}
