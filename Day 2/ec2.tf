resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.free-instance-type
  subnet_id                   = aws_subnet.subnet["public-subnet-1"].id
  vpc_security_group_ids      = [aws_security_group.public-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.PubKey.key_name

  tags = {
    Name = "bastion"
  }
   provisioner "local-exec" {
    command = "echo The public IP address of bastion ec2 instance is ${self.public_ip}"
  }
}

resource "aws_instance" "application" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.free-instance-type
  subnet_id                   = aws_subnet.subnet["private-subnet-1"].id
  vpc_security_group_ids      = [aws_security_group.private-sg.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.PubKey.key_name

  tags = {
    Name = "application"
  } 
}