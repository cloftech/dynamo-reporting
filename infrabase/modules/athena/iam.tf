resource "aws_iam_role" "FunctionRole" {

  name = "${var.project_name}-${var.environment_name}-athena-dynamodb-connector-lambdaRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
}

resource "aws_iam_policy" "FunctionExecutionPolicy" {
  name        = "${var.project_name}-${var.environment_name}-function-execution-policy"
  description = "Permissions for Athena DynamoDB Connector Lambda Function"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "dynamodb:DescribeTable",
          "dynamodb:ListSchemas",
          "dynamodb:ListTables",
          "dynamodb:Query",
          "dynamodb:Scan",
          "glue:GetTableVersions",
          "glue:GetPartitions",
          "glue:GetTables",
          "glue:GetTableVersion",
          "glue:GetDatabases",
          "glue:GetTable",
          "glue:GetPartition",
          "glue:GetDatabase",
          "athena:GetQueryExecution",
          "s3:ListAllMyBuckets"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObjectVersion",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetLifecycleConfiguration",
          "s3:PutLifecycleConfiguration",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "${aws_s3_bucket.dynamodb-spill.arn}",
          "${aws_s3_bucket.dynamodb-spill.arn}/*"
        ],
        "Effect" : "Allow"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "FunctionRole-PolicyAttachment" {
  role       = aws_iam_role.FunctionRole.name
  policy_arn = aws_iam_policy.FunctionExecutionPolicy.arn
}