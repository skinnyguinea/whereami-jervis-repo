variable "vpc_name" {
  description = "Name of the VPC"

}

variable "project_id" {
  description = "Project ID where VPC has to be created"

}

variable "routing_mode" {
  description = "Routing mode for VPC"
  default     = "GLOBAL"

}

variable "subnets" {
  type        = list(map(string))
  description = "Subnet names"
}

variable "secondary_ranges" {
  description = "Secondary ranges if any to be created in the VPC"

}

variable "region" {
  description = "region where subnets will be created"
}

variable "description" {
  type        = string
  description = "An optional description of the resource"
}

