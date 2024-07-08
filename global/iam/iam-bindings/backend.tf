terraform {
  backend "gcs" {
     bucket = "burner-jerferre-tfstate-us-central1-jervis-gcs"
     prefix = "prod/global/iam/iam_bindings"
    
  }
}