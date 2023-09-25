locals {
  aws_region = "us-east-1"
  tags = {
    name = "portfolio-1"
    env  = "dev-portfolio-1"
  }
}

variable "aws_credentials_file_path" {
  description = "Locate the AWS credentials file."
  type        = string
  default     = "C:/Users/param/.ssh/ACS-keys/portfolio-user-1_accessKeys.csv"
}
#bucket & objects
variable "bucket_name" {
  type    = string
  default = "portfolio-web-site-deployment-121-6"
}

# Define a list of files to upload
variable "files_to_upload" {
  type    = list(string)
  default = ["index.html"]
}
variable "aws_region" {
  description = "Default to US East (N. Virgínia) region."
  default     = "us-east-1"
}

variable "github_access_token" {
  default = "hasg"
}
//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

//1