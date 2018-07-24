resource "aws_vpc" "lz" {
  cidr_block                = "${var.lz_vpc}"
  enable_dns_support        = true
  enable_dns_hostnames      = true
  tags {
    Name                    = "LZ-VPC"
  }
}


resource "aws_subnet" "lz_pub_sbn_1a" {
  vpc_id                    = "${aws_vpc.lz.id}"
  cidr_block                = "${var.lz_pub_sbn_1a}"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-southeast-1a"
  tags {
    Name                    = "Lz-Pub-Subnet-1a"
  }
}

resource "aws_subnet" "lz_pub_sbn_1b" {
  vpc_id                    = "${aws_vpc.lz.id}"
  cidr_block                = "${var.lz_pub_sbn_1b}"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-southeast-1b"
  
  tags {
    Name                    = "Lz-Pub-Subnet-1b"
  }
}


resource "aws_internet_gateway" "lz_igw" {
  vpc_id                    = "${aws_vpc.lz.id}"
  tags {
    Name                    = "Lz-IGW"
    }
}
resource "aws_route" "lz_vpc_route" {
  route_table_id            = "${aws_vpc.lz.main_route_table_id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = "${aws_internet_gateway.lz_igw.id}"
}

resource "aws_route_table" "lz_vpc_table" {
  vpc_id                    = "${aws_vpc.lz.id}"
  tags {
    Name                    = "LZ-VPC-Routing"
    }
}


resource "aws_route_table_association" "lz_pub_sbn_1a_association" {
    subnet_id               = "${aws_subnet.lz_pub_sbn_1a.id}"
    route_table_id          = "${aws_route_table.lz_vpc_table.id}"
}
resource "aws_route_table_association" "lz_pub_sbn_1b_association" {
    subnet_id               = "${aws_subnet.lz_pub_sbn_1b.id}"
    route_table_id          = "${aws_route_table.lz_vpc_table.id}"
}
