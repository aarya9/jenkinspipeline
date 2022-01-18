provider "google"{
	project="terraform-336010"
	region="us-central1"
}

resource "google_compute_network" "test_vpc" {
  name = "terraform-network-sample"
}

resource "google_compute_instance" "dev"{
	name         = "devserver"
  	machine_type = "f1-micro"
  	zone         = "us-central1-a"
	admin_ssh_key {
	ssh-keys = var.admin":${file("~/id_rsa_gcp.pub")}"
	}
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
