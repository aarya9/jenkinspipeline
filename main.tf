provider "google" {
  credentials = "/home/raghavjaggu_gmail_com/gcp-key.json"
  project     = "terraform-336010"
  region      = "us-central1"
}

resource "google_compute_network" "test_vpc" {
  name = "terraform-network-sample-one"
}

resource "google_compute_instance" "dev" {
  name         = "devserver-one"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = google_compute_network.test_vpc.name
    access_config {
    }
  }
}
