resource "aws_instance" "nodeA" {
    ami = "ami-0db1de538d84beea0"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.subnet_A.id
    vpc_security_group_ids = [aws_security_group.ssh_between_ec2s.id]

    tags = {
        Name = "nodeA"
    }
}

resource "aws_instance" "nodeB" {
    ami = "ami-0db1de538d84beea0"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.subnet_B.id
    vpc_security_group_ids = [aws_security_group.ssh_between_ec2s.id]

    tags = {
        Name = "nodeB"
    }
}