resource "aws_db_subnet_group" "my_subnet_group" {
  name       = "my-specific-subnet-group"
  subnet_ids = [aws_subnet.subnet["private-subnet-2"].id, aws_subnet.subnet["private-subnet-1"].id]

  tags = {
    Name = "only-private-subnet-2"
  }
}

resource "aws_db_instance" "my-rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = "123456789"
  db_subnet_group_name = aws_db_subnet_group.my_subnet_group.name
  skip_final_snapshot  = true
  tags = {
    Name = "my-rds"
  }
}

resource "aws_elasticache_serverless_cache" "my-redis" {
  engine = "redis"
  name   = "my-redis"
  cache_usage_limits {
    data_storage {
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }
  daily_snapshot_time      = "09:00"
  description              = "Test Server"
  kms_key_id               = aws_kms_key.my-key.arn
  major_engine_version     = "7"
  snapshot_retention_limit = 1
  security_group_ids       = [aws_security_group.private-sg.id]
  subnet_ids               = [aws_subnet.subnet["private-subnet-2"].id, aws_subnet.subnet["private-subnet-1"].id, ]
  tags = {
    Name = "my-redis"
  }
}
