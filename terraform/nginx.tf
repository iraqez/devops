resource "proxmox_lxc" "nginx" {
  target_node  = "proxmox"
  hostname     = "nginx"
  ostemplate   = var.ubuntu2404
  password     = var.password
  unprivileged = true
  cores        = 2
  memory       = 512
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)
  vmid = 101

  rootfs {
    storage    = "containers"
    size       = "2G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.217/24"
    gw         = "192.168.10.1"
  }
}


