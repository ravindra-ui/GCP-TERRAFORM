resource "google_cloud_run_service" "cloud-run-test" {
  name = "cloud-run-test"
  location = "us-central1"

  template {
    
    spec {

      containers {

        image = "gcr.io/steel-pod-360505/latest"
        ports {
        
          container_port = 80
        }  

      }
    }
  }
}
  

resource "google_cloud_run_service_iam_policy" "pub_access" {
  service = google_cloud_run_service.cloud-run-test.name
  location = google_cloud_run_service.cloud-run-test.location
  policy_data = data.google_iam_policy.pub-1.policy_data

}

data "google_iam_policy" "pub-1" {
  binding {
    role = "roles/run.invoker"
    members = [ "allUsers" ]
  }
  
}