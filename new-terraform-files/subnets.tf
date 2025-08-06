resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.cyber_vpc.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet-A"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.cyber_vpc.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet-B"
  }
}
