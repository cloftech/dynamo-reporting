variable "project_name" {
  description = "Enter project name"
}

variable "environment_name" {
  description = "Enter environment name"
}

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