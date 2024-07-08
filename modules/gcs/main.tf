resource "google_storage_bucket" "bucket" {
   name = var.name
   project = var.project_id
   location = var.location
   storage_class = var.storage_class
   labels = var.labels
   force_destroy = var.force_destroy

   versioning {
    enabled = var.versioning
   }

   dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
        is_locked = var.retention_policy.is_locked
        retention_period = var.retention_policy.retention_period
    }
   } 

   dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
        default_kms_key_name = var.encryption.default_kms_key_name
    }
      
   }
}

