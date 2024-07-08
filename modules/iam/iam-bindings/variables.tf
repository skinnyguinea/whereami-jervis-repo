variable "project_id" {
    description = "Project ID for the bindings"
}

variable "roles" { 
   description = "The roles that need to be assigned to the service account" 
   type = set(string)
}

