#Child module for EC2 instance

resource "aws_instance" "ec2-1" {
  ami = "ami-0d03cb826412c6b0f"
  instance_type = "t2.micro"
  subnet_id = var.sn
  security_groups = var.sg

  tags = {
    name = "ec2-instance"
  }
}
