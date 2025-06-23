resource "null_resource" "wordpress_setup" {
  depends_on = [aws_instance.kiran_web]

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y git httpd php",
      "sudo amazon-linux-extras install -y mariadb10.5 php7.4",
      "sudo git clone https://github.com/kiran/wordpress-app.git /tmp/wp",
      "sudo cp -r /tmp/wp/* /var/www/html/",
      "sudo chown -R apache:apache /var/www/html",
      "sudo chmod -R 755 /var/www/html",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = aws_instance.kiran_web.public_ip
    }
  }
}

resource "null_resource" "null-resource-local-chrome" {
  provisioner "local-exec" {
    command = "chrome http://${aws_instance.kiran_web.public_ip}/"
  }
}
