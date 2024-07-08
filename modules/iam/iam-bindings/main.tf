resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = each.value
  for_each = var.roles

  members = [
    "serviceAccount:jervis-kubernetes-sa@burner-jerferre.iam.gserviceaccount.com",
  ]
}