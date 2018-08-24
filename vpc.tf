resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  
  tags {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

  tags {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"

  tags {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "aws_internet_gateway"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "main"
  }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.r.id}"
}
