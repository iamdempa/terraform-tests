resource "aws_instance" "dbserver" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  tags = {
      Name = "dbserver"
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web-sg.name}"]
  user_data = "${file("server-script.sh")}"

  tags = {
      Name = "webserver"
  }
}

resource "aws_security_group" "web-sg" {
    name = "web-sg"

    ingress {
        to_port = 80
        from_port = 80
        protocol = "TCP"

        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        to_port = 80
        from_port = 80
        protocol = "TCP"

        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        to_port = 443
        from_port = 443
        protocol = "TCP"

        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        to_port = 443
        from_port = 443
        protocol = "TCP"

        cidr_blocks = ["0.0.0.0/0"]
    }
}

# setting elastic ip

resource "aws_eip" "elastic-ip" {
  instance = "${aws_instance.webserver.id}"
}

output "db_private_ip" {
  value = "${aws_instance.dbserver.private_ip}"
}

output "web-public-ip" {
  value = "${aws_instance.webserver.id}"
}





