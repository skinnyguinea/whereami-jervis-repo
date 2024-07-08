# Global

project_id = "burner-jerferre"
region     = "us-central1"
zones      = ["us-central1-a", "us-central1-b" ]

#Network

network    = "jervis-standalone-vpc"
subnetwork = "jervis-gke-subnet"

#Cluster configuration

gke_cluster_master_version     = "1.29.4-gke.1043002"
gke_cluster_min_master_version = "1.29.4-gke.1043002"
master_ipv4_cidr_block         = "10.10.0.0/28"

master_authorized_networks = [
  {
    cidr_block   = "49.36.98.70/32"
    display_name = "jervis_laptop"
  }
]

gce_labels = {
  project    = "burner-jerferre",
  env        = "pre-prod",
  created-by = "terraform"
}

service_account = "jervis-kubernetes-sa@burner-jerferre.iam.gserviceaccount.com"
maintenance_start_time = "00:00"
# node pool configuration 

image_type         = "COS_CONTAINERD"
machine_type       = "e2-medium"
preemptible        = false
auto_repair        = "true"
auto_upgrade       = "true"
node_count         = 1
enable_autoscaling = true
min_node_count     = 1
max_node_count     = 3
disk_size_gb       = 100
disk_type          = "pd-standard"
kubernetes_labels = {
  project    = "burner-jerferre",
  node_group = "jervis-test-node-pool",
  env        = "pre-prod"

}
