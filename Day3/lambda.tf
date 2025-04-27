resource "aws_lambda_function" "my_lambda" {
  filename         = "lambda.zip"
  function_name    = "send_email_lambda"
  handler          = "lambda.lambda_handler"
  runtime          = "python3.12"
  role             = aws_iam_role.iam_for_lambda.arn

  environment {
    variables = {
      SENDER_EMAIL = aws_ses_email_identity.to.email
      RECIPIENT_EMAIL = aws_ses_email_identity.from.email
    }
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.state_bucket_id

  lambda_function {
    lambda_function_arn = aws_lambda_function.my_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    # filter_prefix       = "env:/dev/terraform.tfstate"
    filter_suffix       = ".tfstate"
  }

  depends_on = [aws_lambda_permission.allow_s3]
}