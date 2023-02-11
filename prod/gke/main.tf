data "terraform_remote_state" "vpc" {
  backend = "gcs"
  workspace = terraform.workspace
  config = {
    bucket  = "terraformfinalproject"
    prefix  = "terraform/prod/"
    credentials = "../creds.json"
   }
}


module "gke" {
  source                     = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke?ref=zhakyp"
  name                       = "prod-cluster-zhakyp"
  network_name               = data.terraform_remote_state.vpc.outputs.vpc_network_name
  subnet_name                = data.terraform_remote_state.vpc.outputs.subnet_name
  ip_range_pods              = data.terraform_remote_state.vpc.outputs.cluster_pods_ip_cidr_range
  ip_range_services          = data.terraform_remote_state.vpc.outputs.cluster_services_ip_cidr_range
  master_ipv4_cidr_block     = data.terraform_remote_state.vpc.outputs.cluster_master_ip_cidr_range
  network_policy             = false
  horizontal_pod_autoscaling = true
  enable_private_endpoint    = true
  enable_private_nodes       = true
  authorized_ipv4_cidr_block = "10.0.0.0/32"
}