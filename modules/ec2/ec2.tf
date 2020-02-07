variable "ec2name" {
  type =  "string"
}

variable "instance_type" {
  type = "string"
}


resource "aws_instance" "module-instance" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "${var.instance_type}"

  tags = {
      Name = "${var.ec2name}"
  }
}