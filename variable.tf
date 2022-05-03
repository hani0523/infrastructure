variable "file_name" {
  type = string
  description = "Source zip lambda file name"
}

variable "handler" {
 type = string 
 description = "Lambda function handler"
}

variable "function_name" {
  type = string
  description = "Lambda Function Name"
}

variable "lambda_handler_name" {
  type = string
  description = "Handler name for the lambda function"
  default  = "lambda_handler"
}

variable "runtime" {
  type = string 
  description = "Runtime to be used by the lambda function"
  default = "python3.8"
}
