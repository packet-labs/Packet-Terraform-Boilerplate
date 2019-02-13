output "webservers" {
  value = ["${packet_device.webservers.*.access_public_ipv4}"]
}
