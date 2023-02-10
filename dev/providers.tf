terraform {
  cloud {
    organization = "roza"

    workspaces {
      name = "final-dev"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}