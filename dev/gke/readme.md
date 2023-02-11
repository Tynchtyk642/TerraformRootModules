## Terraform GKE Cluster Module
This Terraform module creates a Google Kubernetes Engine (GKE) cluster in a Google Cloud environment. The module requires several inputs, including the network and subnet information, IP ranges for pods, services, and master, network policy, and authorization information.

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Usage

```terraform
data "terraform_remote_state" "vpc" {
  backend = "gcs"
  workspace = terraform.workspace
  config = {
    bucket  = "terraformfinalproject"
    prefix  = "terraform/sql_vpc.tfstate/vpc/"
    credentials = "../creds.json"
   }
}

module "gke" {
  source                     = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke?ref=zhakyp"
  name                       = "dev-cluster-zhakyp"
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

```
Then perform the following commands on the root folder:

+ `terraform init` terraofrm initialization
+ `terraform plan` to see the infrastructure plan
+ `therraform apply` to apply infastructure build
+ `terraform destroy` to destroy the build infastructure


| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke | zhakyp |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
