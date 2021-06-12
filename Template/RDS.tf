
#Subnets of RDS
resource "aws_db_subnet_group" "default" {
  name       = "${var.projectname}_db_subnet_group"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  tags = {
    Name = "${var.projectname}_db_subnet_group"
  }
}

#RDS
resource "aws_db_instance" "default" {
  allocated_storage       = var.disk_size
  storage_type            = var.storage_type
  engine                  = "mysql"
  engine_version          = var.engine_version
  instance_class          = var.instance_size
  name                    = "${var.projectname}db"
  username                = var.dbuser
  password                = var.dbpassword
  parameter_group_name    = aws_db_parameter_group.default.name
  backup_retention_period = 7
  identifier              = "${var.projectname}-rds-server"
  publicly_accessible     = "false"
  skip_final_snapshot     = "true"
  vpc_security_group_ids  = [aws_security_group.main.id]
  db_subnet_group_name    = aws_db_subnet_group.default.name

}

#DB parameter group
resource "aws_db_parameter_group" "default" {
  name   = "${var.projectname}-rds-parameter"
  family = "mysql5.7"

  parameter {
    name  = "binlog_format"
    value = "ROW"
  }
}



