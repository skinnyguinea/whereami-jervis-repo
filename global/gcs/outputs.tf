output "bucket" {
   description = "The bucket created for storing terraform state file"
   value = module.gcs.bucket
}