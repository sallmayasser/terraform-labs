resource "aws_instance" "bastion" {
  ami                         = var.ami-image
  instance_type               = var.free-instance-type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.public-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.PubKey.key_name

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "application" {
  ami                         = var.ami-image
  instance_type               = var.free-instance-type
  subnet_id                   = aws_subnet.private-subnet.id
  vpc_security_group_ids      = [aws_security_group.private-sg.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.PubKey.key_name

  tags = {
    Name = "application"
  }
}
