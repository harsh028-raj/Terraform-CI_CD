
#Child module for VPC
resource "aws_vpc" "myvpc" {
   cidr_block = "10.0.0.0/16"
   enable_dns_hostnames = true
   enable_dns_support = true

   tags = {
     name = "myvpc"
   } 
}

#Create subnet
resource "aws_subnet" "pb_sn" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.myvpc.id
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
tags = {
  name = "sn"
}
}

#Create Security List
resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "my_sg"
    description = "allow public ip connectivity"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
