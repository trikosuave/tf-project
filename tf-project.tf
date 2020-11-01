provider "aws" {
    profile = "default"
    region  = var.region
}

resource "aws_key_pair" "tf-project" {
  key_name   = "tf-project"
  public_key = file("tf-project.pub")
}

resource "aws_instance" "tf-instance" {
    ami           = var.amis[var.region]
    instance_type = "t2.micro"
    key_name      = aws_key_pair.tf-project.key_name
}