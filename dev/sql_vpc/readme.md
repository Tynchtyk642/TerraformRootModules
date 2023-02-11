## Terraform Code for Deploying VPC and MSSQL on Google Cloud Platform
This Terraform code deploys a Virtual Private Cloud (VPC) and Microsoft SQL Server (MSSQL) on Google Cloud Platform (GCP). The code uses two child modules vpc and mssql for the deployment.

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.49.0 |

```terraform
module "vpc" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc?ref=lunara"

  source_ranges = var.source_range
  subnets = var.subnetworks
}


module "sql" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud-sql?ref=lunara"

  private_network = module.vpc.vpc
  depends_on      = [module.vpc.private_vpc_connection]
  read_replicas = var.replicas
  password = var.passwd
}
```
Then perform the following commands on the root folder: 
 
+ `terraform init` terraform initialization 
+ `terraform plan` to see the infrastructure plan 
+ `therraform apply` to apply infastructure build 
+ `terraform destroy` to destroy the build infastructure


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke | lunara |
| <a name="module_sql"></a> [sql](#module\_sql) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud-sql | lunara |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc | lunara |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_passwd"></a> [passwd](#input\_passwd) | This argument sets the password for the root user of the database instance. | `string` | `"lunara.2001"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | The variable is defined as a map, which allows it to store multiple read replicas and their respective information. | `map` | <pre>{<br>  "replica1": {<br>    "region": "us-central1",<br>    "zone": "us-central1-a"<br>  },<br>  "replica2": {<br>    "region": "europe-west1",<br>    "zone": "europe-west1-b"<br>  }<br>}</pre> | no |
| <a name="input_source_range"></a> [source\_range](#input\_source\_range) | If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. | `list` | n/a | yes |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | n/a | `map` | <pre>{<br>  "subnet1": {<br>    "cidr_block": "10.1.0.0/24",<br>    "private_ip_google_access": false,<br>    "region": "us-east1",<br>    "subnet_name": "first-public-subnet"<br>  },<br>  "subnet2": {<br>    "cidr_block": "10.2.0.0/24",<br>    "private_ip_google_access": false,<br>    "region": "us-east1",<br>    "subnet_name": "second-public-subnet"<br>  },<br>  "subnet3": {<br>    "cidr_block": "10.11.0.0/24",<br>    "private_ip_google_access": true,<br>    "region": "us-east1",<br>    "subnet_name": "first-private-subnet"<br>  },<br>  "subnet4": {<br>    "cidr_block": "10.22.0.0/24",<br>    "private_ip_google_access": true,<br>    "region": "us-east1",<br>    "subnet_name": "second-private-subnet"<br>  },<br>  "subnet5": {<br>    "cidr_block": "10.33.0.0/24",<br>    "private_ip_google_access": true,<br>    "region": "us-east1",<br>    "subnet_name": "third-private-subnet"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network"></a> [network](#output\_network) | n/a |
| <a name="output_subnetworks"></a> [subnetworks](#output\_subnetworks) | n/a |
