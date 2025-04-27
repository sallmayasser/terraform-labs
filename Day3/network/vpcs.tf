# Create a VPC

resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr
  tags = {
    Name = "my-vpc"
  }
}
