resource "aws_instance" "count-instance" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  count = 3
  tags = {
      Name = "count"
  }
}