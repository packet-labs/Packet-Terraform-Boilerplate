variable "auth_token" {
  description = "Your Packet API key"
}

variable "packet_project_id" {
  description = "Your Packet Project ID"
}

variable "public_key_filename" {
  description = "SSH public key to be placed into deployed bare metal hosts"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_filename" {
  description = "SSH private key associated with public key"
  default     = "~/.ssh/id_rsa"
}

# for a full list of facilities, see: https://www.packet.com/developers/api/#facilities
variable "facilities" {
  description = "Prioritized list of facilities (data center) to deploy bare metal hosts"
  default     = ["ewr1"]
}

variable "webserver_count" {
  description = "Number of webserver bare metal hosts to spin up"
  default     = "2"
}

variable "webserver_plan" {
  description = "Set the Packet server type for the webservers"
  default     = "t1.small.x86"
}

variable "operating_system" {
  description = "Base operating system to install on bare metal hosts"
  default     = "ubuntu_16_04"
}

