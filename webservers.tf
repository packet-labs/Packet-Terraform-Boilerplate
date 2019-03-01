variable "hostname" {
  default = "web"
}

resource "packet_device" "webservers" {

  depends_on       = ["packet_ssh_key.host_key"]

  project_id       = "${var.packet_project_id}"
  facilities       = "${var.facilities}"
  plan             = "${var.webserver_plan}"
  operating_system = "${var.operating_system}"
  hostname         = "${format("%s-%02d", "${var.hostname}", count.index)}"

  count            = "${var.webserver_count}"

  billing_cycle    = "hourly"
  tags             = ["webserver"]

  connection {
    user        = "root"
    private_key = "${file("${var.private_key_filename}")}"
  }
}
