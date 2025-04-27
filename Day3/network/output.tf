output "subnets" {
    value = aws_subnet.subnet
}

output "public-sg" {
  value = aws_security_group.public-sg
}
output "private-sg" {
  value = aws_security_group.private-sg
}