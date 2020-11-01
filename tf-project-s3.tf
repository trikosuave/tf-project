resource "aws_s3_bucket" "tf-project-s3" {
  bucket = var.s3bucket
  acl    = "private"
}