resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-gateway"
  }
}
