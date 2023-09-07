data "archive_file" "dynamodb_stream_lambda_function" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "dynamoconnector-0d648e51-4544-41a9-8d0b-4d7ab15fb5bc"
}