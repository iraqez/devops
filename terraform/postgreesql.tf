resource "proxmox_lxc" "postgreesql" {
  target_node  = "proxmox"
  hostname     = "postgreesql"
  ostemplate   = var.ubuntu2404
  password     = var.password
  unprivileged = true
  cores        = 4
  memory       = 2048
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)
  vmid = 104

  rootfs {
    storage    = "containers"
    size       = "8G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.220/24"
    gw         = "192.168.10.1"
  }
}


