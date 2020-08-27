resource "aws_instance" "server_01" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}