variable "servers" {
  type = "list"
}

resource "aws_instance" "count-instance" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  count = "${length(var.servers)}"
  associate_public_ip_address = true

  tags = {
      Name = "${var.servers[count.index]}"
  }
}

output "public_ip" {
  value = ["${aws_instance.count-instance.*.public_ip}"]
}
