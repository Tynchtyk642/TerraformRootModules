## Terraform GKE Cluster Module
This Terraform module creates a Google Kubernetes Engine (GKE) cluster in a Google Cloud environment. The module requires several inputs, including the network and subnet information, IP ranges for pods, services, and master, network policy, and authorization information.

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.49.0 |

## Usage

``` terraform 
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
```
Then perform the following commands on the root folder: 
 
+ `terraform init` terraform initialization 
+ `terraform plan` to see the infrastructure plan 
+ `therraform apply` to apply infastructure build 
+ `terraform destroy` to destroy the build infastructure

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke | lunara |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster being created | `string` | `"dev-cluster-lunara"` | no |
