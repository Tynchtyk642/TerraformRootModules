terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.49.0"
    }
  }
  backend "gcs" { 
      bucket      = "terraformlunara" 
      prefix      = "terraform/dev/" 
      credentials = "creds.json" 
    }
}

provider "google" {
  credentials = file("creds.json")
  project     = "optical-genre-373802"
  region      = "us-central1"
  zone        = "us-central1-b"

}