# Import VPC resource
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Import private subnet resource
module "private_subnet" {
  source = "./private_subnet"
  vpc_id = aws_vpc.my_vpc.id
}

# Import security group resource
module "instance_sg" {
  source  = "./security_group"
  vpc_id  = aws_vpc.my_vpc.id
}

# Import EC2 instance resource
module "private_instance" {
  source          = "./ec2_instance"
  subnet_id       = module.private_subnet.subnet_id
  security_groups = [module.instance_sg.security_group_id]
  private_ip      = "10.0.1.10"
  ami_id          = "ami-0c55b159cbfafe1f0"
  key_pair_name   = "your_key_pair_name"
}

output "private_instance_ip" {
  value = module.private_instance.private_ip
}
