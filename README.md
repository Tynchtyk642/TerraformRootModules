# *Terraform AWS Root Deployment
## This module deploys an Amazon Web Services (AWS) infrastructure root module using Terraform.

## Variables
## This module takes the following variables as input:

- *region (optional, default: us-west-2) - The AWS region to deploy the infrastructure in.*
- *vpc_cidr (optional, default: 10.0.0.0/16) - The CIDR block for the Virtual Private Cloud (VPC).*
- *public_subnet_cidr (optional, default: 10.0.1.0/24) - The CIDR block for the public subnet.*
- *private_subnet_cidr (optional, default: 10.0.2.0/24) - The CIDR block for the private subnet.*
# Outputs
## This module outputs the following values:

- *vpc_id - The ID of the VPC.*
- *public_subnet_id - The ID of the public subnet.*
- *private_subnet_id - The ID of the private subnet.*
# Usage
## To use this module, add the following code to your Terraform configuration:

```terraform
 module "eks_cluster" {
  source = "git::<URL_OF_THIS_REPO>//eks_cluster?ref=main"

  env         = <env_name>
  vpc_id      = <vpc_id>
  eks_name    = "test1"
  eks_version = "1.20"
  subnets     = <list of Private Subnets>
  vpn_cidr    = <CIDR Block list of Public Subnets>
  region      = "us-east-1"

  node_groups = {
    first = {
      node_group_name = "test"
      desired_size    = 3
      max_size        = 4
      min_size        = 2

      ami_type       = "AL2_x86_64"
      instance_types = ["t2.medium"]
    },
  }
}
```
## Then perform the following commands on the root folder:

- *terraform init terraform initialization*
- *terraform plan to see the infrastructure plan*
- *terraform apply to apply infrastructure build*
- *terraform destroy to destroy the infrastructure*
## Commands for connecting to the EKS Cluster:
```terraform
aws eks --region <eks_region> update-kubeconfig --name <eks_name>
```

## The "workspaces" block specifies the configuration options for the Terraform Cloud workspaces. A workspace is a place where Terraform keeps the state of your infrastructure, as well as any metadata about the infrastructure.

![photo_5418086731665752988_x](https://user-images.githubusercontent.com/100186256/218064906-4c662bc8-f72a-477a-8d25-5ac9fdf33e57.jpg)
