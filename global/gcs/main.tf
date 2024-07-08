module "gcs" {
     source = "../../modules/gcs"
     project_id = var.project_id
     location = var.region
     name = "${var.project_id}-tfstate-${var.region}-jervis-gcs"

}