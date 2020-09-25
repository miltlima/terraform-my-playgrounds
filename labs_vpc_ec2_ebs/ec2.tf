resource "aws_instance" "melebesquet" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  #VPC Subnet // #SG //  #SSH public key 
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = var.PATH_TO_PRIVATE_KEY

  provisioner "local-exec" {
    command = "echo ${aws_instance.melebesquet.public_ip} >> hosts.txt"
  }
}