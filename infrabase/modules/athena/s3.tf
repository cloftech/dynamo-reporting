resource "aws_s3_bucket" "dynamodb-spill" {
  bucket = "${var.project_name}-${var.environment_name}-dataspill-dynamodb"
}