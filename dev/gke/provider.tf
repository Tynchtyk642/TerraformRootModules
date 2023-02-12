terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.52.0"
    }
  }
   backend "gcs" {
      bucket      = "nurda23bucket"
      prefix      = "terraformgke/env/dev/"
      credentials = "../optic.json"
    }
}


provider "google" {
  # Configuration options
  region  = var.region
  project = var.project_id
  credentials = file("../optic.json")
}