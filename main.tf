terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project ="class5-5"
region = "us-central1"
zone = "us-central1-a"
credentials = "class5-5-416402-88c571ec7fc6.json"

}

resource "google_storage_bucket" "starwars-bucket-1" {
  name          = "starwars"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}