resource "aws_instance" "kiran_web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.kiran_public[0].id
  vpc_security_group_ids      = [aws_security_group.kiran_web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name

  tags = { Name = "kiran-wordpress-web" }
}
