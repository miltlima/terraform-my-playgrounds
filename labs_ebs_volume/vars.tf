variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0bcc094591f354be2"
    us-west-1 = "ami-05fe528ab5127b0b2"
    us-west-2 = "ami-0b685684b5f489427"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "cocokey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "cocokey.pub"
}