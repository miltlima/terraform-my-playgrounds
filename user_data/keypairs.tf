resource "aws_key_pair" "cocokey" {
  key_name   = "cocokey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}