provider "aws" {
  region = "us-east-2"

}
module "dev-vpc" {
  env                  = "dev"
  source               = "git::https://github.com/ra1mova/terraform-aws-child.git//vpc?ref=main"
  vpc_cidr             = var.vpc_cidr_block
  public_subnet_cidrs  = slice(var.public_subnet_cidr_blocks, 13, 15)
  private_subnet_cidrs = slice(var.private_subnet_cidr_blocks, 13, 16)
}
module "dev-eks" {
  source          = "git::https://github.com/ra1mova/terraform-aws-child.git//eks?ref=main"
  env             = "dev"
  vpc             = module.dev-vpc.vpc_id
  subnet          = module.dev-vpc.private_subnet_id
  cluster_name    = var.eks_name
  cluster_version = var.eks_version
  # ami_id          = data.aws_ami.eks_default.id
  node_groups = {
    cluster1 = {
      node_group_name = "test"
      desired_size    = 3
      max_size        = 4
      min_size        = 2

      ami_type = "AL2_x86_64"
    },
  }
}
module "instance" {
  source        = "git::https://github.com/ra1mova/terraform-aws-child.git//instance?ref=main"
  env           = "dev"
  public_subnet = module.dev-vpc.subnet_id[0]
  sg            = module.dev-eks.r-security
}
data "aws_ami" "eks_default" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-node-${var.eks_version}-v*"]
  }
}
terraform {
  cloud {
    organization = "terraform-roza1"

    workspaces {
      name = "tfstate"
    }
  }
}