## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.52.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud-sql"></a> [cloud-sql](#module\_cloud-sql) | git::https://github.com/NurdaCodez/sourcer.git//module/cloud-sql | main |
| <a name="module_instance"></a> [instance](#module\_instance) | git::https://github.com/NurdaCodez/sourcer.git//module/instance | main |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/NurdaCodez/sourcer.git//module/vpc | main |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_node_zones"></a> [cluster\_node\_zones](#input\_cluster\_node\_zones) | The zones where Kubernetes cluster worker nodes should be located | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to create resources in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to use | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The GCP service account | `string` | n/a | yes |
| <a name="input_sql_region"></a> [sql\_region](#input\_sql\_region) | Region for SQL, I want to deploy SQL in different region from GKE | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | zone for read replica | `string` | n/a | yes |

## Outputs

No outputs.
