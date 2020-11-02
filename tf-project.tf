provider "aws" {
    profile = "default"
    region  = var.region
}

resource "aws_key_pair" "tf-project-key" {
  key_name   = var.keyname
  public_key = file("tf-project.pub")
}

resource "aws_instance" "tf-project-instance" {
    ami           = var.amis[var.region]
    instance_type = "t2.micro"
    key_name      = aws_key_pair.tf-project-key.key_name
    vpc_security_group_ids = [aws_security_group.tf-project-sg.id]
    iam_instance_profile = aws_iam_instance_profile.tf-project-s3-role-instanceprofile.name
    user_data     = <<EOF
        #!/bin/bash
        yum update -y
        yum install -y python-pip
        pip install awscli
    EOF
}