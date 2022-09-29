terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }
}

provider "google" {
  # Configuration options
  
  project = "steel-pod-360505"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "tf.json"
}

