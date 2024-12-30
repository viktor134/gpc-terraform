terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file("cred/mygcp-cred.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "jenkins_vm" {
  source = "./modules/vm"
}

# Outputs (optional, add if you want to expose information after deployment)
output "vm_ip" {
  value = module.jenkins_vm.default.network_interface.0.access_config.0.nat_ip
}

