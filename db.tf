
resource "aws_db_instance" "mysql-db" {
  identifier        = "database-3"
  storage_type      = "gp2"
  allocated_storage = 20 # don't use  max_allocated_storage for disable autoscaling
  engine            = "mysql"
  engine_version    = "5.7.40"
  instance_class    = "db.t2.micro"
  port              = "3306"
  db_name           = "data"
  username          = "admin"
  password          = "rajat#9776"

  ##db_subnet_group_name    = "default"

  vpc_security_group_ids     = [aws_security_group.mysg.id]
  parameter_group_name       = "default.mysql5.7"
  availability_zone          = "ap-south-1a"
  publicly_accessible        = true
  deletion_protection        = false
  skip_final_snapshot        = true
  auto_minor_version_upgrade = false
  tags = {
    Name = "demomysql"
  }
}
