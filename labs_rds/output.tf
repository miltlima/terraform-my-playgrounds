output "ip" {
  value = aws_instance.melebesquet.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}