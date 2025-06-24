resource "aws_security_group" "ssh_between_ec2s" {
    description = "Allow ssh in security group"
    name = "ssh_between_ec2s"
    vpc_id = aws_vpc.cyber_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ec2A" {
    security_group_id = aws_security_group.ssh_between_ec2s.id
    cidr_ipv4 = aws_subnet.subnet_A.cidr_block
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ec2B" {
    security_group_id = aws_security_group.ssh_between_ec2s.id
    cidr_ipv4 = aws_subnet.subnet_B.cidr_block
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.ssh_between_ec2s.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}