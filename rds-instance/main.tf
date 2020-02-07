resource "aws_db_instance" "rds_instance" {
  name = "banuka_rds"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "admin"
  password = "admin12345"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}
