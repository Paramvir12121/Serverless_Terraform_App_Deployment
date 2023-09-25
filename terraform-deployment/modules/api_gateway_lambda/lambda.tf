# resource "aws_lambda_function" "feedback" {
#   //filename      = "feedback.zip"
#   filename      = "C:/Users/param/OneDrive/Desktop/Dev/Portfolio/Deployment-1/terraform-deployment/modules/api_gateway_lambda/feedback.zip" # Change to your Lambda deployment package
#   function_name = "feedback-function"
#   role          = aws_iam_role.iam_role_feedback.arn
#   handler       = "index.handler"
#   runtime       = "nodejs18.x"
# }

# resource "aws_iam_role" "lmbda-iam" {
#   name = "lambda-iam"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#         "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#     }
#   ]
# }
# EOF
# }


