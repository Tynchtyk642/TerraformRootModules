data "terraform_remote_state" "vpc" { 
  backend = "gcs" 
  workspace = terraform.workspace 
  config = { 
    bucket  = "terraformlunara" 
    prefix  = "terraform/dev/sql_vpc" 
    credentials = "../creds.json" 
   } 
}

module "gke" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke?ref=lunara"

  network_name   = data.terraform_remote_state.vpc.outputs.network
  private_subnet = data.terraform_remote_state.vpc.outputs.subnetworks
  cluster_name = var.cluster_name
  tags = var.tag
}