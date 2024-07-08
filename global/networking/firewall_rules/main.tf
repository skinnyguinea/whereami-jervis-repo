provider "google" {
  project = var.project
  region  = var.region
}

variable "project" {
  description = "The GCP project to deploy to"
}

# variable "region" {
#   description = "The region to deploy resources"
# }

# variable "network" {
#   description = "The network to create firewall rules in"
# }

data "external" "create_firewall_rules" {
  program = [ python, "${path.module}/create_firewall_rules.py"]

  query = {
    network = var.network
    region  = var.region
    project = var.project
  }
}

output "firewall_rules_status" {
  value = data.external.create_firewall_rules.result["status"]
}
