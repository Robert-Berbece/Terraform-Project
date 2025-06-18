output "instance_a_private_ip" {
  value = aws_instance.ec2_a.private_ip
}

output "instance_b_private_ip" {
  value = aws_instance.ec2_b.private_ip
}
