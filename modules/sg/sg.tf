
variable "sec_group_name" {
  type = "string"
}

variable "from_port" {
  type = "string"
}

variable "to_port" {
  type = "string"
}

variable "protocol" {
  type = "string"
}

resource "aws_security_group" "sg" {
  name = "${var.sec_group_name}"

  ingress {
      from_port = "${var.from_port}"
      to_port = "${var.to_port}"
      protocol = "${var.protocol}"

      cidr_blocks = ["0.0.0.0/16"]
  }

  tags = {
      Name = "${var.sec_group_name}"
  }
}
