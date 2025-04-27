resource "aws_security_group" "public-sg" {

  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "private-sg" {
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    #   security_groups = [aws_security_group.public-sg.id]
    cidr_blocks = [aws_vpc.my-vpc.cidr_block]
  }

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    #   security_groups = [aws_security_group.public-sg.id]
    cidr_blocks = [aws_vpc.my-vpc.cidr_block]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}
