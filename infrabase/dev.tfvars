project_name     = "fedrated-quries"
environment_name = "dev"
#Dynamodb
name         = ["sportsworld-nft-collections", "sportsworld-nft-contract-events", "sportsworld-nft-contract-events-metadata", "sportsworld-nft-details", "sportsworld-nft-tasks", "sportsworld-offchain-nfts"]
billing_mode = "PAY_PER_REQUEST"
hash_key     = "id"
#Lambda
handler     = "com.amazonaws.athena.connectors.dynamodb.DynamoDBCompositeHandler"
source_dir  = "../codebase/dynamodb_connector_code"
runtime     = "java11"
#Athena
type        = "LAMBDA"