resource "proxmox_lxc" "djangoMil" {
  target_node  = "proxmox"
  hostname     = "djangoMil"
  ostemplate   = var.ubuntu2404
  password     = var.password
  unprivileged = true
  cores        = 4
  memory       = 2048
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)
  vmid = 105

  rootfs {
    storage    = "containers"
    size       = "8G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.221/24"
    gw         = "192.168.10.1"
  }
}


