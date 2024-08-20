resource "proxmox_lxc" "tfAns" {
  target_node  = "proxmox"
  hostname     = "tfAns"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  password     = var.password
  unprivileged = true
  cores        = 2
  memory       = 512
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = file(var.ssh_public_keys)
  
  rootfs {
    storage    = "slow"
    size       = "4G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.215/24"
    gw         = "192.168.10.1"
  }
}
