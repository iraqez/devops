resource "proxmox_lxc" "gitlab" {
  target_node  = "proxmox"
  hostname     = "gitlab"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  password     = var.password
  unprivileged = true
  cores        = 4
  memory       = 512
  swap         = 256
  # features {
  #   fuse = true
  #   keyctl = true
  #   nesting = true
  # }
  start        = true
  onboot = true
  ssh_public_keys = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgTBBuJ+2ylDcRPHflGKfDpuoD0q82nrlAcRcdI2wYAnVI+L78TFu2j4KjRZzBHsxQtE+N31sondwfns/73dD71Nn0Jp/PFMdKU0gOsz4c2bt6tCsaRnb5bOu98u7cKO/B4BuOGksAWlDxGr/OgTMus8slho6RBCUkgS+PKCR69jPpA629+y07VW6843TZXVP5Ow6BOYSNUND0RcppX18Wff/56l8KXa93ZOq2AreK9e134sCwt8kOndnLjDR/FrSs9OMPVhoAgyh/gKewcyBDv0jnGcvhmuDDjvTu/OvRr18NHw7tf19JkzEOUbkvD8502Bxn9p1XAKRTeyc15+aqGyLEGkCDOAIVHo5VVgNucnOYvsPOZFtFpx/lBOnROr8HRFTtOyvzhlrW5BY6grg4N7KDdnJ6dIj1X3t4mAKdKwqTBIE0/LNELUzelCrV1yVLbqWSuXm66snjnU/iJf1ZOjOwt5L6p+ZNbPW18ilElMw6NStiAET5rJyYNj4begs= iraqez@iraqez-G3-3500
  EOT
  
  rootfs {
    storage    = "slow"
    size       = "8G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.216/24"
    gw         = "192.168.10.1"
  }
}
