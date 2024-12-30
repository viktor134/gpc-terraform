resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = var.startup_script

  # ... (tags can be added here if needed)
}

resource "google_compute_firewall" "allow_ingress" {
  name        = var.firewall_name
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges 
  target_tags   = var.target_tags 
}