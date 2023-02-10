# *Terraform AWS Root Deployment
## This module deploys an Amazon Web Services (AWS) infrastructure root module using Terraform.

# *Requirements
## This module requires Terraform 0.12 or later and the following Terraform providers:

# AWS Provider v2.0 or later
## Variables
# This module takes the following variables as input:

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

## hcl
## Copy code
## module "aws_root" {
  *source = "github.com/your-repository-url.git"*
}
## Then run terraform init and terraform apply to deploy the AWS infrastructure root module.

# Limitations
## This module is currently only supported in the us-west-2 region.

# License
## This module is licensed under the Apache 2.0 License. Please review the LICENSE file for more information.
## The "workspaces" block specifies the configuration options for the Terraform Cloud workspaces. A workspace is a place where Terraform keeps the state of your infrastructure, as well as any metadata about the infrastructure.

![photo_5418086731665752988_x](https://user-images.githubusercontent.com/100186256/218064906-4c662bc8-f72a-477a-8d25-5ac9fdf33e57.jpg)
