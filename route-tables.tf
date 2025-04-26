resource "aws_route_table" "public-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gateway.id

  }

  tags = {
    Name = "public-table"
  }
}

resource "aws_route_table" "private-table" {
  vpc_id = aws_vpc.my-vpc.id
  #   nat route
  tags = {
    Name = "private-table"
  }
}
resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-table.id
}

resource "aws_route_table_association" "private-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-table.id
}