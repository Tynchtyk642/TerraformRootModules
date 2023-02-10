provider "aws" {
  region = "us-east-1"
}

module "vpc-dev" {
    env = "dev"
    source = "git::https://github.com/Jakshylyk8890/modules//vpc?ref=main"
    vpc_cidr = var.vpc
    public_subnet_cidr = var.public_subnet
    private_subnet_cidr = var.private_subnet
}

module "eks-cluster" {
    env = "dev"
    source = "git::https://github.com/Jakshylyk8890/modules//eks?ref=main"
    vpc = module.vpc-dev.aws_vpc
    private_subnet_id = module.vpc-dev.private_subnets
    
}
module "bastion-host" {
    source = "git::https://github.com/Jakshylyk8890/modules//instance?ref=main"
    env = "dev"
    public_subnet = module.vpc-dev.aws_subnet[0]
    ec2-sg = module.vpc-dev.sg-for-bastion-host
}
terraform {
  cloud {
    organization = "final-project"

    workspaces {
      name = "jaks"
    }
  }
}