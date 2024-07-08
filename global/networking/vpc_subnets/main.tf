/***************************
   VPC configuration 
****************************/

module "google_vpc_network" {
  source                  = "../../../modules/networking/vpc"
  project_id              = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  shared_vpc_host         = true
  routing_mode            = var.routing_mode
  description             = var.description

}
/***************************
  Subnet configuration
****************************/

module "google_vpc_subnet" {
  source           = "../../../modules/networking/subnets"
  project_id       = var.project_id
  subnets          = var.subnets
  name             = module.google_vpc_network.network_name
  secondary_ranges = var.secondary_ranges

}