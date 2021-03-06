variable "region" {
    default = "us-west-2"
}

variable "keyname" {
    default = "tf-project"
}

variable "sourceip" {
    default = "11.222.111.22"
}

variable "amis" {
    type = map
    default = {
        "us-east-1" = "ami-0947d2ba12ee1ff75"
        "us-east-2" = "ami-03657b56516ab7912"
        "us-west-1" = "ami-0e4035ae3f70c400f"
        "us-west-2" = "ami-0528a5175983e7f28"
    }
}