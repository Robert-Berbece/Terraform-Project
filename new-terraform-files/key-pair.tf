resource "tls_private_key" "cyber_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "cyber_key_pair" {
  key_name   = "cyber-key-pair"
  public_key = tls_private_key.cyber_key.public_key_openssh

  tags = {
    Name = "cyber-key-pair"
  }
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.cyber_key.private_key_pem
  filename = "${path.module}/cyber-key-pair.pem"
  file_permission = "0400" # Read-only for owner
}

output "ssh_key_name" {
  value = aws_key_pair.cyber_key_pair.key_name
}
