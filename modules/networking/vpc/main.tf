resource "google_compute_network" "vpc_network" {
    project = var.project_id
    name       = var.name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode = var.routing_mode
    description = var.description
}

# resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
#     project = var.project_id
#     count = var.shared_vpc_host ? 1 : 0
#     depends_on = [ google_compute_network.vpc_network ]
# }