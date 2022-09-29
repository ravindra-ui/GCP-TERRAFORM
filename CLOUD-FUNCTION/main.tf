resource "google_storage_bucket" "bucket_tf1" {
  name = "bucket-tf1"
  location = "us-central1"

}


resource "google_storage_bucket_object" "sncode" {
  name = "index.zip"
  bucket = google_storage_bucket.bucket_tf1.name
  source = "index.zip"

}

resource "google_cloudfunctions_function" "fun_from_tf" {
  name = "fun-from-tf"
  runtime = "nodejs14"
  description = "testing purpose"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.bucket_tf1
  source_archive_object = google_storage_bucket_object.sncode.name

  trigger_http = true
  entry_point = "helloworldtf"
  
}

resource "google_cloudfunctions_function_iam_member" "allowaccess" {
  region = google_cloudfunctions_function.fun_from_tf.region
  cloud_function = google_cloudfunctions_function.fun_from_tf.name


  role = "roles/cloudfunctions.invoker"
  member = "allUsers"

  
}