resource "aws_s3_bucket" "tf-project-s3" {
  bucket = "tf-project-s3-bucket-1"
  acl    = "private"
}