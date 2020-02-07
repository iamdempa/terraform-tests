resource "aws_vpc" "kubernetes-main-vpc" {
  cidr_block = "172.16.0.0/18"
  
  tags = {
      Name = "kubernetes-main-vpc"
  }
}

resource "aws_subnet" "kubernetes-public-subnet" {
  vpc_id = "${aws_vpc.kubernetes-main-vpc.id}"
  cidr_block = "172.16.0.0/19"
  tags = {
      Name = "kubernetes-public-subnet"
  }
}

resource "aws_subnet" "kubernetes-private-subnet" {
  vpc_id = "${aws_vpc.kubernetes-main-vpc.id}"
  cidr_block = "172.16.32.0/19"

  tags = {
      Name = "kubernetes-private-subnet"
  }

}

#internet gateway
resource "aws_internet_gateway" "kubernetes-ig" {
  vpc_id = "${aws_vpc.kubernetes-main-vpc.id}"

  tags = {
    Name = "kubernetes-ig"
  }
}

# route table - attach to vpc
resource "aws_route_table" "kubernetes-public-rt" {
  vpc_id = "${aws_vpc.kubernetes-main-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kubernetes-ig.id}"
  }

  tags = {
    Name = "kubernetes-public-rt"
  }
}

# attach public rt to public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.kubernetes-public-subnet.id}"
  route_table_id = "${aws_route_table.kubernetes-public-rt.id}"
}


resource "aws_route_table" "kubernetes-private-rt" {
  vpc_id = "${aws_vpc.kubernetes-main-vpc.id}"

  
  tags = {
    Name = "kubernetes-private-rt"
  }
}

# attach private rt to private subnet
resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.kubernetes-private-subnet.id}"
  route_table_id = "${aws_route_table.kubernetes-private-rt.id}"
}

# creating a eip for NAT gateway
resource "aws_eip" "kubernetes-NAT-eip" {
  tags = {
      Name = "kubernetes-NAT-eip"
  }
}

# creating NAt gateway
resource "aws_nat_gateway" "kubernetes-NAt-gw" {
  allocation_id = "${aws_eip.kubernetes-NAT-eip.id}"
  subnet_id     = "${aws_subnet.kubernetes-public-subnet.id}"
}


# spining up ec2 instances
resource "aws_instance" "kubernetes-master" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.kubernetes-public-subnet.id}"
  availability_zone = "us-east-1a"

  tags = {
    Name = "kubernetes-master"
  }
}




