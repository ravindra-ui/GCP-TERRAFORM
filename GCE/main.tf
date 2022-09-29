
resource "google_compute_instance" "instance1-tf" {
  name = "instance1-tf"
  zone = "asia-east1-a"
  machine_type = "n1-standard-2"
  
  labels = {
    "env" = "tflearning"
  }
/*
  scheduling {
    preemptible = true
    automatic_restart = false
  }
*/
  network_interface {
    network = "default"
    subnetwork = "default"
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10-buster-v20210217"
      size = 20
    }
  }
}