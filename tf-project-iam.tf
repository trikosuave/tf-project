resource "aws_iam_role" "tf-project-s3-role" {
  name               = "tf-project-s3-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "tf-project-s3-role-instanceprofile" {
  name = "tf-project-s3-role"
  role = aws_iam_role.tf-project-s3-role.name
}

resource "aws_iam_role_policy" "tf-project-s3-role-policy" {
  name = "tf-project-s3-role-policy"
  role = aws_iam_role.tf-project-s3-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::tf-project-s3-bucket-1",
              "arn:aws:s3:::tf-project-s3-bucket-1/*"
            ]
        }
    ]
}
EOF
}