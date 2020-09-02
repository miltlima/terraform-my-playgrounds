resource "aws_key_pair" "example-key" {
  key_name   = "examplekey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "server_02" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example-key.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.server_02.private_ip} >> hosts.txt"
  }
  connection {
    user        = var.INSTANCE_USERNAME
    type        = "ssh"
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host        = coalesce(self.public_ip, self.private_ip)
  }
}
