resource "aws" "melebesquet" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.melebesquet.private_ip} >> hosts.txt"
  }
}