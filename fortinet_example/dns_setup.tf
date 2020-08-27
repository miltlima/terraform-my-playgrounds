provider "fortios" {
  version = "~> 1.5"
  hostname = "10.1.2.3"
  token    = var.TOKEN
  insecure = true
}

resource "fortios_system_setting_dns" "dnstest" {
  primary   = "99.99.99.99"
  secondary = "8.8.8.8"
}

resource "fortios_networking_route_static" "routetest" {
  dst = "83.25.12.19/32"
  gateway = "1.1.1.1"
  blackhole = "disable"
  distance = "22"
  weight = "3"
  priority = "1"
  device = "port1"
  comment = "Dns demo test"
}


