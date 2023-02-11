variable "source_range" {
    type = list
}

variable "subnetworks" {
    type = map
    default = {
        subnet1 = {
      subnet_name = "first-public-subnet"
      cidr_block = "10.1.0.0/24"
      region = "us-east1"
      private_ip_google_access = false
    }
    subnet2 = {
      subnet_name = "second-public-subnet"
      cidr_block = "10.2.0.0/24"
      region = "us-east1"
      private_ip_google_access = false
    }
    subnet3 = {
      subnet_name = "first-private-subnet"
      cidr_block = "10.11.0.0/24"
      region = "us-east1"
      private_ip_google_access = true
        }
    subnet4 = {
      subnet_name = "second-private-subnet"
      cidr_block = "10.22.0.0/24"
      region = "us-east1"
      private_ip_google_access = true
    }
    subnet5 = {
      subnet_name = "third-private-subnet"
      cidr_block = "10.33.0.0/24"
      region = "us-east1"
      private_ip_google_access = true
        }
    }
}

variable "replicas" {
    type = map
    default = {
        replica1 = { 
      region      = "us-central1", 
      zone        = "us-central1-a", 
    }
  replica2 = { 
      region      = "europe-west1", 
      zone        = "europe-west1-b", 
    } 
    }
}

variable "passwd" {
  type = string
  sensitive = true 
  default = "lunara.2001"
}
