resource "aws_lambda_function" "ConnectorConfig" {
  function_name    = "${var.project_name}-${var.environment_name}-dynamodb-connector"
  description      = "Enables Amazon Athena to communicate with DynamoDB, making your tables accessible via SQL"
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  filename         = data.archive_file.dynamodb_stream_lambda_function.output_path
  source_code_hash = data.archive_file.dynamodb_stream_lambda_function.output_base64sha256
  role             = aws_iam_role.FunctionRole.arn

  environment {
    variables = {
      disable_spill_encryption = false
      spill_bucket             = aws_s3_bucket.dynamodb-spill.bucket
      spill_prefix             = "athena-spill/"
    }
  }
}