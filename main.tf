resource "aws_vpc" "main" {
  cidr_block = var.vpc
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = false
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_b
  availability_zone       = var.az_b
  map_public_ip_on_launch = false
}

resource "aws_security_group" "allow_ssh_sec_gr" {
  name        = "internal-ssh-only"
  vpc_id      = aws_vpc.main.id
  description = "Allow SSH from internal subnets only"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_subnet_a" {
  security_group_id = aws_security_group.allow_ssh_sec_gr.id
  cidr_ipv4         = var.subnet_a
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from subnet A"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_subnet_b" {
  security_group_id = aws_security_group.allow_ssh_sec_gr.id
  cidr_ipv4         = var.subnet_b
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from subnet B"
}


resource "aws_instance" "ec2_a" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_a.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh_sec_gr.id]
  associate_public_ip_address = false
  tags = {
    Name = "Instance-A"
  }
}

resource "aws_instance" "ec2_b" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_b.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh_sec_gr.id]
  associate_public_ip_address = false
  tags = {
    Name = "Instance-B"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
