import boto3
import csv


# S3 bucket and object key for the CSV file
s3_bucket = ""
s3_object_key = ""

# DynamoDB table name
dynamodb_table_name = ""

# Connect to AWS resources
dynamodb = boto3.resource('dynamodb')
s3 = boto3.client('s3')

# Read CSV data from S3
csv_data = s3.get_object(Bucket=s3_bucket, Key=s3_object_key)['Body'].read().decode('utf-8').splitlines()

# Connect to DynamoDB table
table = dynamodb.Table(dynamodb_table_name)

# Iterate over CSV rows and insert into DynamoDB
csv_reader = csv.DictReader(csv_data)
for row in csv_reader:
    table.put_item(Item=row)


def lambda_handler(event, context):
    print("Done")