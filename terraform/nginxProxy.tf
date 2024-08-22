resource "proxmox_lxc" "nginxProxy" {
  target_node  = "proxmox"
  hostname     = "nginxProxy"
  ostemplate   = var.ubuntu2404
  password     = var.password
  unprivileged = true
  cores        = 2
  memory       = 512
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)

  # features {
  #   keyctl = true
  #   nesting = true
  # }
  
  rootfs {
    storage    = "containers"
    size       = "8G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.219/24"
    gw         = "192.168.10.1"
  }
}
