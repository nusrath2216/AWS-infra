resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = var.security_groups
  private_ip    = var.private_ip

  tags = {
    Name = "private_instance"
  }

  key_name = var.key_pair_name
}

output "private_ip" {
  value = aws_instance.private_instance.private_ip
}
