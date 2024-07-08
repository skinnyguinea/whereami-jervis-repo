variable "project_id" {
     description = "The ID of the project where this VPC will be created"
}

variable "name" {
     description = "The name of the network being created"  
}

variable "routing_mode" {
#      default = GLOBAL
      description = "The network routing mode"
}

variable "description" {
     description = "An optional description of this resource"  
}

variable "shared_vpc_host" {
    description = "Makes this project a shared VPC host if set to true"
}

variable "auto_create_subnetworks" {
description = "When set to true the network is created in 'auto subnet mode'"
}