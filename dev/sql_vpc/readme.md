## Terraform Code for Deploying VPC and MSSQL on Google Cloud Platform
This Terraform code deploys a Virtual Private Cloud (VPC) and Microsoft SQL Server (MSSQL) on Google Cloud Platform (GCP). The code uses two child modules vpc and mssql for the deployment.

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.49.0 |


## Usage

```terraform
module "vpc" {
  source          = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc?ref=zhakyp"
  network_name    = "zhakypsnetwork"
  nat_subnet_name = "privatesubnet3"
  subnets = [
    {
      subnet_name     = "privatesubnet1"
      subnet_ip_range = var.privatesubnet1
      subnet_region   = "us-west1"
    },
    {
      subnet_name           = "privatesubnet2"
      subnet_ip_range       = var.privatesubnet2
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
    {
      subnet_name           = "privatesubnet3"
      subnet_ip_range       = var.privatesubnet3
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
      {
      subnet_name           = "publicsubnet1"
      subnet_ip_range       = var.publicsubnet1
      subnet_region         = "us-west1"
      subnet_private_access = false
    },
    {
      subnet_name           = "publicsubnet2"
      subnet_ip_range       = var.publicsubnet2
      subnet_region         = "us-central1"
      subnet_private_access = false
    },

  ]
}

module "mssql" {
  source       = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud_sql?ref=zhakyp"
  network_name = module.vpc.network_name
  depends_on = [
    module.vpc.private_vpc_connection
  ]
}

```
Then perform the following commands on the root folder:

+ `terraform init` terraofrm initialization
+ `terraform plan` to see the infrastructure plan
+ `therraform apply` to apply infastructure build
+ `terraform destroy` to destroy the build infastructure

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mssql"></a> [mssql](#module\_mssql) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud_sql | zhakyp |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc | zhakyp |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_privatesubnet1"></a> [privatesubnet1](#input\_privatesubnet1) | IP range of Private subnetwork | `string` | `"10.100.0.0/16"` | no |
| <a name="input_privatesubnet2"></a> [privatesubnet2](#input\_privatesubnet2) | IP range of Private subnetwork | `string` | `"10.101.0.0/16"` | no |
| <a name="input_privatesubnet3"></a> [privatesubnet3](#input\_privatesubnet3) | IP range of Private subnetwork | `string` | `"10.102.0.0/16"` | no |
| <a name="input_publicsubnet1"></a> [publicsubnet1](#input\_publicsubnet1) | IP range of Public subnetwork | `string` | `"10.1.0.0/24"` | no |
| <a name="input_publicsubnet2"></a> [publicsubnet2](#input\_publicsubnet2) | IP range of Public subnetwork | `string` | `"10.104.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_master_ip_cidr_range"></a> [cluster\_master\_ip\_cidr\_range](#output\_cluster\_master\_ip\_cidr\_range) | n/a |
| <a name="output_cluster_pods_ip_cidr_range"></a> [cluster\_pods\_ip\_cidr\_range](#output\_cluster\_pods\_ip\_cidr\_range) | n/a |
| <a name="output_cluster_services_ip_cidr_range"></a> [cluster\_services\_ip\_cidr\_range](#output\_cluster\_services\_ip\_cidr\_range) | n/a |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | n/a |
| <a name="output_vpc_network_name"></a> [vpc\_network\_name](#output\_vpc\_network\_name) | n/a |
