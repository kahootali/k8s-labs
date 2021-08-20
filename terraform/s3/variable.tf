variable "s3_name" {
  description = "S3 Name"
  type        = string
  default = "kahoot-private-bucket"
}

variable "create_s3" {
  description = "Whether to create S3 bucket"
  type        = bool
  default = true
}
variable "region" {
  type        = string
  default = "us-east-1"
}