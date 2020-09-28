resource "aws_route53_zone" "locomotive-labs" {
  name = "locomotive.labs"
}
resource "aws_route53_record" "cell-record" {
  zone_id = "${data.aws_route53_zone.locomotive-labs.zone_id}"
  name    = "cell.locomotive.labs"
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}
resource "aws_route53_record" "www-record" {
  zone_id = "${data.aws_route53_zone.locomotive-labs.zone_id}"
  name    = "www.locomotive.labs"
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}

resource "aws_route53_record" "mail-record" {


}
