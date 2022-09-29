
resource "google_storage_bucket" "bucket-test1" {
  name = "terraform-course-bucket-test"

  storage_class = "STANDARD"

  location = "US-CENTRAL1"

  
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "picture" {
  name = "error-1.logo"
  bucket = google_storage_bucket.bucket-test1.name
  source = "error-1.png"
}