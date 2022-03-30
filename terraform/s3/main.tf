resource "aws_s3_bucket" "bucket" {
  count  = var.create_s3 ? 1 : 0
  bucket = var.s3_name
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "KahootTerraformBucket"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "3.9.0"
#     }
#   }
# }
