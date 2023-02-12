data "terraform_remote_state" "vpc" {
  backend = "gcs"
  workspace = terraform.workspace
  config = {
    bucket  = "nurda23bucket"
    prefix  = "terraform/sql_vpc.tfstate/vpc/default.tfstate"
    credentials = "../optic.json"
  }
}



module "gke" {
  source = "git::https://github.com/NurdaCodez/sourcer.git//module/gke?ref=main"

  project_id                 = var.project_id
  region                     = var.region
  location                   = var.region
  node_zones                 = var.cluster_node_zones
  service_account            = var.service_account
  network                    = data.terraform_remote_state.vpc.outputs.network
  subnet_name                = data.terraform_remote_state.vpc.outputs.private_subnet
  master_ipv4_cidr_block     = data.terraform_remote_state.vpc.outputs.cluster_master_ip_cidr_range
  pods_ipv4_cidr_block       = data.terraform_remote_state.vpc.outputs.cluster_pods_ip_cidr_range
  services_ipv4_cidr_block   = data.terraform_remote_state.vpc.outputs.cluster_services_ip_cidr_range
  authorized_ipv4_cidr_block = "192.168.2.246/32" #will be used for bastion in future 
  depends_on_subnetwork      = data.terraform_remote_state.vpc.outputs.private_subnet.name
}
