variable "project_name" {
  description = "Enter project name"
}

variable "environment_name" {
  description = "Enter environment name"
}

variable "type" {
  description = "Type of your data catalog"
  type        = string
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

variable "timeout" {
  description = "Type of your data catalog"
  default     = 900
}

variable "memory_size" {
  description = "Source path of the lambda code"
  default     = 3008
}
