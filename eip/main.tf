resource "aws_instance" "eip-instance" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  tags = {
      Name = "public-ip"
  }
}

resource "aws_eip" "elasticip" {
  instance = "${aws_instance.eip-instance.id}"
}


output "public_ip" {
  value = "${aws_eip.elasticip.public_ip}"
}

