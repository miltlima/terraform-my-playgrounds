terraform {
  backend "s3" {
    bucket = "terraform-playground-state0309201103"
    key    = "terraform/labs_vpc_nat"
  }
}