resource "aws_vpc" "cyber_vpc" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "cyber-vpc"
  }
}
