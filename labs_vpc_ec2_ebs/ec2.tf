resource "aws" "melebesquet" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  #VPC Subnet // #SG //  #SSH public key 
  subnet_id               = aws_subnet.main-public-1.id
  vpc_security_groups_ids = [aws_security_group.allow-ssh.id]
  key_name                = aws_key_pair.cocokey.key_name

  provisioner "local-exec" {
    command = "echo ${aws_instance.melebesquet.private_ip} >> hosts.txt"
  }
}