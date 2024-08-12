resource "proxmox_lxc" "vmRemote" {
  target_node  = "proxmox"
  hostname     = "vmRemote"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  password     = var.password
  unprivileged = true
  cores        = 2
  memory       = 512
  swap         = 256
  start        = true
  onboot       = true
  ssh_public_keys = <<-EOT
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgTBBuJ+2ylDcRPHflGKfDpuoD0q82nrlAcRcdI2wYAnVI+L78TFu2j4KjRZzBHsxQtE+N31sondwfns/73dD71Nn0Jp/PFMdKU0gOsz4c2bt6tCsaRnb5bOu98u7cKO/B4BuOGksAWlDxGr/OgTMus8slho6RBCUkgS+PKCR69jPpA629+y07VW6843TZXVP5Ow6BOYSNUND0RcppX18Wff/56l8KXa93ZOq2AreK9e134sCwt8kOndnLjDR/FrSs9OMPVhoAgyh/gKewcyBDv0jnGcvhmuDDjvTu/OvRr18NHw7tf19JkzEOUbkvD8502Bxn9p1XAKRTeyc15+aqGyLEGkCDOAIVHo5VVgNucnOYvsPOZFtFpx/lBOnROr8HRFTtOyvzhlrW5BY6grg4N7KDdnJ6dIj1X3t4mAKdKwqTBIE0/LNELUzelCrV1yVLbqWSuXm66snjnU/iJf1ZOjOwt5L6p+ZNbPW18ilElMw6NStiAET5rJyYNj4begs= iraqez@iraqez-G3-3500
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIbeH9jNNATer+f6IY4H+W24piY+AdvSynJ14HShuBQZgs39SPd0lWpJ/6g7vOpTpgLF03mkJPfhTEbYRM6s/jxTmo3iWMJtnvkMBclwh+oSkVyyZI8e8b7TRvN9sXzsgf2SczV63XSM53whnuix08dFtjheUUSfDjmDWCzVY/ejj5K2GI6zR5c0M1YM2ODHIuhi+rheCbCyXuh/pDIOAD2nv/55/2zwYqBVqPL+s4q9oRXDDZs++Ns7vPzQPHCUWReYNNN8eWDroyVAZjHCQMFopM0JXsY3iktIYvIure3qbPYubp4Q1xn+GrF8uNUWyT0RhIBG3RLieedXGw05yf59BRNyXbeP9FGwLXeGwo1/gMabNQCvxrFlBNfHPa1yHkXGFqhw1flabddoTNDFkn/aXrvJV+tZFiisHT7D4Z09cVbJVc2/2SUUrNetLV9nZsy3tdz4Zs3g44RysRe9JgI72UoutA5u9ZzUx0RfED3pvIIX2gkb7KoAmD1x+8mpvdwKSDllFrCJU4dnLyMFwKKo/gu5DNmIIT80ajqm++oChE5rk91Oyh3fM2NSU7DIAZJB5Doo/xpBVsxW4l/4BwDMzvow4+xDZAsGRK4OSXu7+zRiCnE7/vi6dBZL7r5m6GN1apkTkhwMdnY6S2Usrw+DYb0ld1Eb5aspMFKgOngQ== vladimir.gumenyuk@gmail.com
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDg2RuxEThp11jMGGEPFqFmYgQx+UnzrDlGmMOwnxmYKxT74/JH7LrgT5IrtUpuMJE21EjkJp+y4BZlhZKckjzEfyOivmN/FaszGX26uWMzslQQQ+zIfoulnDycL6TODhcPJ6mfXtk6JDfrjj7jUfXaGksuUZs5L18NwnMsih91F2KgDehv6DNqDZKYO7iHh7h/ZZFpzFa8IoKyr1EAY8GRieD6/AYy9TN4Pk14WPqC+Q54PhLMTeSLPvZ/oH7Bx4yMz0UmhXBpzput1X3ZXzwDnRSKe62M+VJOJIqry6a9T7ST9RlycbgE+C5b7PEPL/yydI6CoUUaYwJFgArtqXLXXdEtWgsQpCFwjBIeK5849y8qgp7LNF70zoUDxfofv4w9nrR+TFfxP3rihQfYQoYoi7m1UqQCnj49wauhOXyGu+5auk0HCZ0EViPzeoOzfCgp2RXBGAvj1pdK5Rl/khXzPq2g6npqRqhzcjFDMQ7gP1z3mza/X5hO4npHfACtzs= iraqez@minibook
  EOT
  
  rootfs {
    storage    = "slow"
    size       = "4G"
  }

  network {
    name       = "eth0"
    bridge     = "vmbr0"
    ip         = "192.168.10.218/24"
    gw         = "192.168.10.1"
  }
}
