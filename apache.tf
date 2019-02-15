
resource "null_resource" "apache" {

    depends_on = ["packet_device.webservers"]

    count = "${var.webserver_count}"

    connection {
        type = "ssh"
        host = "${element(packet_device.webservers.*.access_public_ipv4,count.index)}"
        private_key = "${file("${var.private_key_filename}")}"
        agent = false
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get -y update",
            "apt-get -y install apache2",
            "echo `hostname` > /var/www/html/index.html"
        ]
    }
}


