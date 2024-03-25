variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "key_pair_name" {
  description = "The name of the EC2 key pair"
  default     = "your_key_pair_name"
}

variable "subnet_id" {
  description = "The ID of the subnet"
}

variable "security_groups" {
  description = "The list of security groups"
  type        = list(string)
  default     = []
}

variable "private_ip" {
  description = "The private IP address for the EC2 instance"
}
