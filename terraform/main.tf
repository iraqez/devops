terraform {
  required_providers {
    proxmox = {
        source = "Telmate/proxmox"
        version = "2.9.11"
    }
  }
}

# provider "proxmox" {
#     pm_api_url = "https://192.168.10.51:8006/api2/json"
#     pm_api_token_id = "terraform@pam!terraform"
#     pm_api_token_secret = "1d29c2e6-17cb-485f-b27b-3490e33b01ea"

# }

provider "proxmox" {
    pm_api_url = "https://192.168.10.51:8006/api2/json"
    pm_api_token_id = "root@pam!root"
    pm_api_token_secret = "f2f4f35f-d088-4bec-ae0e-96486cc3856a"
    # pm_password = "workfree"

}

# provider "proxmox" {
#   endpoint = "https://192.168.10.51:8006/"
#   username = "root"
#   password = "workfree"
#   insecure = true

#   ssh {
#     agent = true
#   }
# }

