variable "hostname" {
  default = "web"
}

resource "packet_device" "webservers" {
  project_id       = "${var.packet_project_id}"
  facility         = "${var.facility}"
  plan             = "${var.webserver_plan}"
  operating_system = "${var.operating_system}"
  hostname         = "${format("%s-%s-%02d", "${var.facility}", "${var.hostname}", count.index)}"

  count            = "${var.webserver_count}"

  billing_cycle    = "hourly"
  tags             = ["webserver"]

  connection {
    user        = "root"
    private_key = "${file("${var.private_key_filename}")}"
  }
}
