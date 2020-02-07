resource "aws_instance" "eip-instance" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  tags = {
      Name = "${local.owner}"
  }
}