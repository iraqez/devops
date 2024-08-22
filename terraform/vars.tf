variable "password" {
    default = "workfree"
}

variable "ssh_public_keys" {
default = "/home/iraqez/.ssh/id_rsa.pub"
}

variable "ubuntu2404" {
    default = "isos:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}
