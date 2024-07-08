#Global terraform variables file
vpc_name    = "jervis-standalone-vpc"
project_id  = "burner-jerferre"
region      = "us-central1"
description = "Sample Network created for testing purposes"

#Subnet

subnets = [
  {
    subnet_name           = "jervis-gke-subnet"
    subnet_ip             = "10.2.3.0/24"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]

secondary_ranges = {
  jervis-gke-subnet = [
    {
      range_name    = "jervis-gke-pod-range"
      ip_cidr_range = "10.2.16.0/20"

    },
    {
      range_name    = "jervis-gke-subnet-range"
      ip_cidr_range = "10.2.4.0/24"
    }
  ]
}