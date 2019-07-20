terraform {
  backend "gcs" {
    bucket = "storage-bucket-tmp1"
    prefix = "prod"
  }
}