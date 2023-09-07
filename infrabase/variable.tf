variable "project_name" {
  description = "Enter project name"
}

variable "environment_name" {
  description = "Enter environment name"
}

#Dynamodb
variable "name" {
  description = "Name of the tables"
  type        = list(string)
}

variable "hash_key" {
  description = "Partition key value"
  type        = string
}

variable "billing_mode" {
  description = "Select the Billing mode"
  type        = string
}

variable "type" {
  description = "Type of your data catalog"
}

variable "source_dir" {
  description = "Source path of the lambda code"
  type        = string
}

variable "handler" {
  description = "handler of your lambda file"
  type        = string
}

variable "runtime" {
  description = "Your function runtime "
  type        = string
}