resource "aws_instance" "sg" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web-traffic.name}"]
  tags = {
      Name = "sg"
  }
}

resource "aws_security_group" "web-traffic" {
  name = "Allow HTTPS"

  // inbound rules  
  ingress {
      from_port = 443
      to_port = 443
      protocol = "TCP"

      cidr_blocks = ["0.0.0.0/0"]

  }

  // outbound rules
  egress {
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
