# module "s3_bucket_webpages" {
#   source                    = "./modules/s3_bucket_webpages"
#   aws_region                = local.aws_region
#   files_to_upload           = var.files_to_upload
#   bucket_name               = var.bucket_name
#   aws_credentials_file_path = var.aws_credentials_file_path
#   tags                      = local.tags
# }

//Not able to auto build amplify in terraform for simple webpage - to look for in future
# module "aws_amplify" {
#   source              = "./modules/amplify"
#   app-name            = "Power of Math"
#   amplify_repository  = "https://github.com/Paramvir12121/tf_aws_amplify_webpage"
#   github_access_token = var.github_access_token
#   tags                = local.tags
# }


# module "api_gateway" {
#   source                  = "./modules/api_gateway_lambda"
#   api_gateway_name        = "portofolio-app-api"
#   api_gateway_description = "Portfolio app API Gateway"
# }

data "archive_file" "lambda-zip" {
  type        = "zip"
  source_dir  = "./modules/lambda/lambda_code"
  output_path = "lambda.zip"
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_filename  = "lambda.zip"
  function_name    = "feedback-function"
  handler          = "lambda.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.lambda-zip.output_base64sha256
}