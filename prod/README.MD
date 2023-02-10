

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion-host"></a> [bastion-host](#module\_bastion-host) | git::https://github.com/Jakshylyk8890/modules//instance | main |
| <a name="module_eks-cluster"></a> [eks-cluster](#module\_eks-cluster) | git::https://github.com/Jakshylyk8890/modules//eks | main |
| <a name="module_vpc-dev"></a> [vpc-dev](#module\_vpc-dev) | git::https://github.com/Jakshylyk8890/modules//vpc | main |


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | Assigning CIDR for the private subnet | `list` | <pre>[<br>  "10.2.3.0/24",<br>  "10.2.4.0/24",<br>  "10.2.5.0/24"<br>]</pre> | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Assigning CIDR for the public subnets | `list` | <pre>[<br>  "10.2.0.0/24",<br>  "10.2.1.0/24"<br>]</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Assigning CIDR for the vpc | `string` | `"10.2.0.0/16"` | no |
