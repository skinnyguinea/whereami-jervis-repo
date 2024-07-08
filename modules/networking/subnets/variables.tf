variable "name" {
    description = "The name of the network where subnets will be created"
}

variable "project_id" {
    description = "The ID of the project where subnets will be created"
}

variable "secondary_ranges" {
     type        = map(list(object({ range_name = string, ip_cidr_range = string })))
     description = "Secondary ranges to be used in some of the subnets"
     default ={}
}

variable "subnets" {
    type = list(map(string)) 
    description = "The list of subnets being created" 
}