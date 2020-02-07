# resource "aws_iam_user" "main_user" {
#   name = "MainUser"
# }
provider "aws" {
  region = "us-east-1"
}

module "ec2-module"{
    source = "./ec2"
    ec2name = "module-test"
    instance_type = "t2.micro"
}

module "sg-module" {
  source = "./sg"
  from_port = 443
  to_port = 443
  protocol = "TCP"
  sec_group_name = "banu-sg"
}



