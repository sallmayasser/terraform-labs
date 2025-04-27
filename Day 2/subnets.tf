# resource "aws_subnet" "public-subnet" {
#   vpc_id     = aws_vpc.my-vpc.id
#   availability_zone = var.availability-zone-1
#   cidr_block = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "public-subnet"
#   }
# }

# resource "aws_subnet" "private-subnet" {
#   vpc_id     = aws_vpc.my-vpc.id
#   availability_zone = var.availability-zone-1
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = "private-subnet"
#   }
# }

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  for_each                = { for subnet in var.subnet-list : subnet.name => subnet }
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.value.name
  }

}
