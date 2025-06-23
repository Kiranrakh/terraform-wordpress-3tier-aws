resource "aws_db_subnet_group" "kiran_db_subnet_group" {
  name       = "kiran-db-subnet-group"
  subnet_ids = aws_subnet.kiran_private[*].id

  tags = { Name = "kiran-db-subnet-group" }
}

resource "aws_db_instance" "kiran_rds" {
  identifier              = "kiran-rds-db"
  engine                  = "mysql"
  engine_version          = "8.0.36"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  name                    = var.db_name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.kiran_db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.kiran_db_sg.id]
  skip_final_snapshot     = true

  tags = { Name = "kiran-rds" }
}
