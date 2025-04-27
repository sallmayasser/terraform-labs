aws-region          = "us-east-1"
availability-zone-1 = "us-east-1a"
availability-zone-2 = "us-east-1b"
ami-image           = "ami-084568db4383264d4"
free-instance-type  = "t2.micro"
vpc-cidr            = "10.0.0.0/16"
subnet-list = [
  {
    name = "public-subnet-1"
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
    type = "public"
  },
  {
    name = "public-subnet-2"
    cidr = "10.0.3.0/24"
    az   = "us-east-1b"
    type = "public"
  },
  {
    name = "private-subnet-1"
    cidr = "10.0.2.0/24"
    az   = "us-east-1a"
    type = "private"
  },
  {
    name = "private-subnet-2"
    cidr = "10.0.4.0/24"
    az   = "us-east-1b"
    type = "private"
  }
]
