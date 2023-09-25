resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  #   acl    = "private"
  tags = var.tags
}


# Create separate resource blocks for each file
resource "aws_s3_bucket_object" "object" {
  depends_on = [aws_s3_bucket.bucket]
  for_each   = { for file in var.files_to_upload : file => file }

  bucket = var.bucket_name
  key    = each.value
  source = "../static_website_3/${each.value}"
  #   etag   = filemd5("../static_website_3/${each.value}")
  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  depends_on = [aws_s3_bucket_object.object]
  bucket     = aws_s3_bucket.bucket.id
  policy     = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}


# resource "aws_s3_bucket_policy" "website_policy" {
#   bucket = aws_s3_bucket.bucket.id

#   policy = <<EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "PublicReadGetObject",
#         "Effect": "Allow",
#         "Principal": "*",
#         "Action": "s3:GetObject",
#         "Resource": "${aws_s3_bucket.bucket.arn}/*"
#       }
#     ]
#   }
#   EOF
# }

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

