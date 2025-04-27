resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  for_each                = { for subnet in var.subnets : subnet.name => subnet }
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.value.name
  }

}
