output "ip" {
  value = "${aws_instance.server_03.public_ip}"
}