data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "NodeA" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.nodes_internal_ssh.id]
  key_name               = aws_key_pair.cyber_key_pair.key_name
  associate_public_ip_address = false

  tags = {
    Name = "NodeA"
  }
}

resource "aws_instance" "NodeB" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_b.id
  vpc_security_group_ids = [aws_security_group.nodes_internal_ssh.id]
  key_name               = aws_key_pair.cyber_key_pair.key_name
  associate_public_ip_address = false

  tags = {
    Name = "NodeB"
  }
}
