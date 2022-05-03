terraform {
  backend "s3" {
    key = "base-infrastructure/app-backend/terraform.tfstate"
  }
}

# Configuring the AWS Provider in us-east-2 region
provider "aws" {
  region = var.region
}

module "lambda-function" {
  source        = "../../../modules/lambda"
  file_name     = "../bin/lambda_jwt_authorizer.zip"
  function_name = "lambda-authorizer"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
}
