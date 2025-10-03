variable "project" { 
  type = string 
}

variable "region" { 
  type = string 
}

variable "cluster_name" { 
  type = string 
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 1

  node_config {
    machine_type = "e2-micro"
  }
}
