resource "aws_subnet" "subnet_A" {
    vpc_id = aws_vpc.cyber_vpc.id
    cidr_block = "10.10.1.0/24"
    availability_zone = "eu-west-1a"

    tags = {
        Name = "subnet_A"
    }
}

resource "aws_subnet" "subnet_B" {
    vpc_id = aws_vpc.cyber_vpc.id
    cidr_block = "10.10.2.0/24"
    availability_zone = "eu-west-1b"

    tags = {
        Name = "subnet_B"
    }
}