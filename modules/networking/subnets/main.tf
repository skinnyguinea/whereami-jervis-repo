locals {
  subnets = {
    for x in var.subnets :
    "${x.subnet_region}/${x.subnet_name}" => x
  }
}


resource "google_compute_subnetwork" "basic" {
   for_each = local.subnets
   name = each.value.subnet_name
   ip_cidr_range = each.value.subnet_ip
   region        = each.value.subnet_region
   private_ip_google_access =  lookup(each.value,"subnet_private_access", false)
   network = var.name
   project = var.project_id
   description = lookup(each.value, "description", null)
   secondary_ip_range = [
    for i in range(
      length(
        contains(
        keys(var.secondary_ranges), each.value.subnet_name) == true
        ? var.secondary_ranges[each.value.subnet_name]
        : []
    )) :
    var.secondary_ranges[each.value.subnet_name][i]
   ]      
}