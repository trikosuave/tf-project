# tf-project

An AWS Terraform project that creates an EC2 instance and an S3 bucket. SSH access is allowed to the EC2 instance from a specified IP address. 
The EC2 instance has read/write access to the S3 bucket. AWS CLI has been installed on the instance via user data in order to verify access to the S3 bucket.

# Assumptions

* User has Terraform 0.13 or newer installed.
* Default VPC can/will be used.
* S3 bucket name used is still available. Can be changed, if needed, in tf-project-s3.tf and tf-project-iam.tf.
* User will modify tf-project-vars to enter their IP address (http://whatismyip.com) and/or change their region or key name.
* User will create an ssh key pair in the local directory.
* User will launch in us-east-1, us-east-2, us-west-1, or us-west-2.

# How-to

1) Clone the repository: `git clone https://github.com/trikosuave/tf-project.git`
2) Get your IP Address (http://whatismyip.com) and update sourceip in tf-project-vars.tf. Update the region, if needed. Keep or change the key name as it will be needed in the next step. 
3) Create a new key pair with the name set in step 1. `ssh-keygen -f tf-project`
4) Run `terraform plan` and make sure everything looks as expected.
5) Run `terraform apply` and confirm 'yes' to build out the resources.
6) Once terraform is complete, log in to the instance via the IP output by Terraform: `ssh -i <key_name> ec2-user@<ipaddress>`
7) Create a test file, if desired, to verify S3 access: `touch test.txt`
8) Copy the file to the S3 bucket: `aws s3 cp test.txt s3://tf-project-s3-bucket-1/test.txt`