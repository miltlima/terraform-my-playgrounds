resource "aws_instance" "server_01" {
  ami           = "ami-0bcc094591f354be2"
  instance_type = "t2.micro"
}