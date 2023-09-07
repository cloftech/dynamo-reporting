module "dynamodb" {
  source           = "./modules/dynamodb"
  project_name     = var.project_name
  environment_name = var.environment_name
  name             = var.name
  hash_key         = var.hash_key
  billing_mode     = var.billing_mode
}

module "athena" {
  source           = "./modules/athena"
  project_name     = var.project_name
  environment_name = var.environment_name
  type             = var.type
  source_dir       = var.source_dir
  handler          = var.handler
  runtime          = var.runtime
}