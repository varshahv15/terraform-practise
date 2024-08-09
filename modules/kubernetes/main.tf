resource "google_container_cluster" "primary" {
  name     = "primary-cluster"
  location = "us-central1"
  
  node_config {
    machine_type = "e2-medium"
  }
}
