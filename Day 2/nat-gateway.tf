# resource "aws_eip" "nat-eip" {
#   domain = "vpc"
#   tags = {
#     Name = "nat-eip "
#   }
# }

# resource "aws_nat_gateway" "my-nat-gateway" {
#   allocation_id     = aws_eip.nat-eip.id
#   connectivity_type = "public"
#   subnet_id         = aws_subnet.public-subnet.id
#   tags = {
#     Name = "my-nat-gateway"
#   }
#   depends_on = [aws_internet_gateway.my-gateway]
# }
