terraform {
  backend "gcs" {
    bucket = "storage-bucket-tmp2"
    prefix = "stage"
  }
}