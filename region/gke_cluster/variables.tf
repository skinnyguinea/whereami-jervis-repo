variable "project_id" {
  description = "Project ID for the GKE cluster"
  type        = string
}

variable "region" {
  description = "Region of the cluster"
  type        = string
}

variable "network" {
  description = "VPC of the cluster"
  type        = string
}

variable "subnetwork" {
  description = "Subnet of the cluster"
  type        = string
}

variable "zones" {
  description = "Zones that the cluster spans across"
  type        = list(string)

}

variable "maintenance_start_time" {
  description = "Time window specified for daily or recurring maintenance operations in RFC3339 format"
  type        = string

}

variable "gke_cluster_min_master_version" {
  description = ""
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block"
  type        = string

}

variable "regional" {
  description = "Whether the GKE cluster is zonal or regional"
  default     = true
}

variable "image_type" {
  description = "Type of OS image used for the nodes"
  default     = "COS_CONTAINERD"
}

variable "machine_type" {
  description = "Machine type of the node"

}

variable "node_count" {
  description = "Number of nodes in node pool"

}

variable "preemptible" {
  description = "Choose whether to use spot instances or not"
  default     = false
}

variable "enable_autoscaling" {
  description = "Choose to enable autoscaling"
  default     = true
}

variable "auto_repair" {
  description = "Choose to enable auto repair"
  default     = true
}

variable "auto_upgrade" {
  description = "Choose to enable auto upgrade"
  default     = false
}

variable "min_node_count" {
  description = "Minimum node count in node pool"
}

variable "max_node_count" {
  description = "Maximum node count in node pool"

}

variable "service_account" {
  description = "Service account used for the nodes"
}

variable "kubernetes_labels" {
  default = ""
}

variable "gce_labels" {
  type = map(string)
}

variable "disk_type" {
  description = "Type of disk attached to nodes"
}

variable "disk_size_gb" {
  description = "Size of disk in GB"
}

variable "gke_cluster_master_version" {
  default = ""
}

variable "master_authorized_networks" {

}