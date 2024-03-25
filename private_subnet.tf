resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-1a"  # Change to your desired availability zone

  tags = {
    Name = "private_subnet"
  }
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}
