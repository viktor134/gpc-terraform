variable "instance_name" {
  type = string
  description = "Name of the Jenkins VM instance"
  default = "my-vm"
}

variable "machine_type" {
  type = string
  description = "Machine type for the Jenkins VM"
  default = "n1-standard-1"
}

variable "image" {
  type = string
  description = "Machine image for the VM"
  default = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
}

variable "startup_script" {
  type = string
  description = "Startup script for the VM"
  default = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y openjdk-11-jdk
    curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
  EOT
}

# Firewall variables
variable "firewall_name" {
  type = string
  default = "allow-http-ssh"
}

variable "allowed_ports" {
  type = list(number)
  description = "List of allowed ports for the firewall"
  default = [22, 80, 8080] 
}

variable "source_ranges" {
  type = list(string)
  description = "List of source IP ranges or CIDR blocks"
  default = ["0.0.0.0/0"] 
}

variable "target_tags" {
  type = list(string)
  description = "List of target tags for the firewall"
}