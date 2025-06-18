variable "vpc" {
  default = "10.10.0.0/16"
}

variable "subnet_a" {
  default = "10.10.1.0/24"
}

variable "subnet_b" {
  default = "10.10.2.0/24"
}

variable "az_a" {
  default = "eu-west-1a"
}

variable "az_b" {
  default = "eu-west-1b"
}

variable "instance_type" {
  default = "t3.micro"
}
