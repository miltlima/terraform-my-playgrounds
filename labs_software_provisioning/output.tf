output "public_ip" {
  value = "${aws_instance.server_02.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.server_02.private_ip}"
}
