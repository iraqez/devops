resource "proxmox_lxc" "gitlab" {
  target_node  = "proxmox"
  hostname     = "gitlab"
  ostemplate   = var.ubuntu2404
  password     = var.password
  unprivileged = true
  cores        = 4
  memory       = 512
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)
  
  rootfs {
    storage    = "containers"
    size       = "8G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.216/24"
    gw         = "192.168.10.1"
  }
}
