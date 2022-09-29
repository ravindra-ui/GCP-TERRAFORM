
resource "google_compute_network" "auto-vpc-test1-tf" {

  name = "auto-vpc-test1-tf"
  auto_create_subnetworks = true

}

resource "google_compute_network" "custom-vpc-test2-tf" {
  name = "custom-vpc-test2-tf"
  auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "sub-net1" {
  name = "sub-net1"
  network = google_compute_network.custom-vpc-test2-tf.id
  ip_cidr_range = "10.1.0.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true
  
}


resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-test2-tf.id
  allow {
    protocol = "icmp" 
  }
  source_ranges = ["103.70.201.56/32"]
  

}