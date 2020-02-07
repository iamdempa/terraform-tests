resource "aws_instance" "ec2-depend" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  tags = {
      Name = "dependent"
  }

  depends_on = ["aws_instance.ec2-not-depend"]
}

resource "aws_instance" "ec2-not-depend" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  tags = {
      Name = "not-dependent"
  }
}

