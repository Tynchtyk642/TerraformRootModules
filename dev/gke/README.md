## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | git::https://github.com/NurdaCodez/sourcer.git//module/gke | main |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

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
