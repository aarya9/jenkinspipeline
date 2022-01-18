provider "google"{
	project="terraform-336010"
	region="us-central1"
}
resource "google_compute_instance" "dev"{
	name         = "devserver"
  	machine_type = "f1-micro"
  	zone         = "us-central1-a"
}
