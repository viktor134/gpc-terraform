variable "project_id" {
  type = string
  description = "Your GCP project ID"
}

variable "region" {
  type = string
  description = "The region where resources will be created"
  default = "us-central1"
}

variable "zone" {
  type = string
  description = "The zone within the region for resources"
  default = "us-central1-a"
}


