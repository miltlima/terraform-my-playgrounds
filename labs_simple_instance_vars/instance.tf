resource "aws_instance" "server_01" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.server_01.private_ip} >> hosts.txt"
  }
}