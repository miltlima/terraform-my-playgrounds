resource "aws_route53_zone" "locomotive-labs" {
  name = "locomotive.labs"
}
resource "aws_route53_record" "cell-record" {
  zone_id = aws_route53_zone.locomotive-labs.zone_id
  name    = "cell.locomotive.labs"
  type    = "A"
  ttl     = "300"
  records = ["108.211.207.4"]
}
resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.locomotive-labs.zone_id
  name    = "www.locomotive.labs"
  type    = "A"
  ttl     = "300"
  records = ["108.211.207.4"]
}

resource "aws_route53_record" "mail-record" {
  zone_id = aws_route53_zone.locomotive-labs.zone_id
  name    = "locomotive.labs"
  type    = "MX"
  ttl     = "300"
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com."
  ]
}
