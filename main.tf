provider "google" {
  project = "terraform-test-try"
  credentials = file("D:/DEAKIN/2024 T2/SIT764 PROJECT A/Terraform/terraform/credentials.json")
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
