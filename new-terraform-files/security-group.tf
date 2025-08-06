resource "aws_security_group" "nodes_internal_ssh" {
  name        = "nodes-internal-ssh"
  description = "Allow SSH traffic between subnets"
  vpc_id      = aws_vpc.cyber_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.1.0/24", "10.10.2.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nodes-ssh-only"
  }
}
