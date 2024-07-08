# Define the remote state backend
remote_state {
  backend = "gcs"
  config = {
    bucket = "burner-jerferre-tfstate-us-central1-jervis-gcs"
    prefix = "prod/global/networking/vpc"
  }
}

# Define input variables
inputs = {
  project_id = "burner-jerferre"
  region     = "us-central1"
  network    = "jervis-standalone-vpc"
  subnetwork = "jervis-gke-subnet"
}

# Define the Terraform source
terraform {
  source = "../../../modules/networking/vpc"
}
