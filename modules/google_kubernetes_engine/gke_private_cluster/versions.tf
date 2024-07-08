terraform {
  required_version = ">= 0.13"
  required_providers {
     google = {
      source = "hashicorp/google"
    }
    null = "> 2.1"
    random = "> 2.2" 
    kubernetes = "2.31.0"
  }
}