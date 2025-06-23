output "web_instance_public_ip" {
  value = aws_instance.kiran_web.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.kiran_rds.endpoint
}

