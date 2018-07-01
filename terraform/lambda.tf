provider "aws" {
  region = "eu-west-2"
}

resource "aws_lambda_function" "sms_lambda" {
  function_name = "SMSLambda"

  s3_bucket = "surf66-lambda"
  s3_key    = "v${var.app_version}/deployable.zip"

  handler = "index.handler"
  runtime = "nodejs6.10"

  role = "${aws_iam_role.sms_lambda_exec.arn}"
}

resource "aws_iam_role" "sms_lambda_exec" {
  name = "sms_lambda_exec"

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