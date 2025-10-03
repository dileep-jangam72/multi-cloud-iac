module "kubernetes" {
  source       = "../../modules/kubernetes"
  project      = "my-gcp-project-id"
  region       = "us-central1"
  cluster_name = "demo-gke-cluster"
}
