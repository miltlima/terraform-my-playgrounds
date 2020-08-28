resource "aws_key_pair" "example-key" {
  key_name   = "examplekey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "demo_02" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example-key.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    user     = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host = "self.public_ip"
  }
}
