resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "this" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = var.file_name
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.lambda_handler_name
  source_code_hash = filebase64sha256(var.file_name)
  runtime = var.runtime
}
