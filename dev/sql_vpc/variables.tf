variable "source_range" {
    type = list
    description = "If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges."
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
    description = "The variable is defined as a map, which allows it to store multiple read replicas and their respective information."
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
  description = "This argument sets the password for the root user of the database instance."
  sensitive = true 
  default = "lunara.2001"
}
