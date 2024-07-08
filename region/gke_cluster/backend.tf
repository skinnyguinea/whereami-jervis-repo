terraform {
  backend "gcs" {
    bucket = "burner-jerferre-tfstate-us-central1-jervis-gcs"
    prefix = "prod/regional/us-central1/gke-cluster/jervis-test-gke-cluster"
  }
}