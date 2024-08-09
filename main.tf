provider "google" {
  project = "terraform-test-try"
  region  = "us-central1"
}

resource "google_compute_instance" "my_instance" {
  name         = "test-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

module "kubernetes" {
  source = "./modules/kubernetes"
}
