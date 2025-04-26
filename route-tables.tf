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
  
  # route  {
  #   cidr_block = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.my-nat-gateway.id
  # }

  tags = {
    Name = "private-table"
  }
}
resource "aws_route_table_association" "public-association-1" {
  subnet_id      = aws_subnet.subnet["public-subnet-1"].id
  route_table_id = aws_route_table.public-table.id
}
resource "aws_route_table_association" "public-association-2" {
  subnet_id      = aws_subnet.subnet["public-subnet-2"].id
  route_table_id = aws_route_table.public-table.id
}

resource "aws_route_table_association" "private-association-1" {
  subnet_id      = aws_subnet.subnet["private-subnet-1"].id
  route_table_id = aws_route_table.private-table.id
}
resource "aws_route_table_association" "private-association-2" {
  subnet_id      = aws_subnet.subnet["private-subnet-2"].id
  route_table_id = aws_route_table.private-table.id
}
