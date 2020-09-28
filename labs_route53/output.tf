output "ns-servers" {
  value = aws_route53_zone.locomotive-labs.name_servers
}