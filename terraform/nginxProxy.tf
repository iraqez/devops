resource "proxmox_lxc" "nginxProxy" {
  target_node  = "proxmox"
  hostname     = "nginxProxy"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
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
