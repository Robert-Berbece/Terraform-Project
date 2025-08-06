output "NodeA_private_ip" {
  value = aws_instance.NodeA.private_ip
}

output "NodeB_private_ip" {
  value = aws_instance.NodeB.private_ip
}

output "ssh_private_key_path" {
  value = local_file.private_key_pem.filename
  description = "Path to the generated private key file"
}
