# dev
# 2 Public Subnets, 3 Private Subnets
# tag for Public Subnets `"kubernetes.io/role/elb" = 1`
# tag for Private Subnets `"kubernetes.io/role/internal-elb" = 1`
# eks that is called `dev-eks`
# eks cluster and node groups is on private subnets
# all network resources with the tag `environment = dev`
# bastion host (instance) on public subnet

provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "remote" {
    organization = "final-project"

    workspaces {
      name = "statefiles"
    }
  }
}

module "networking" {
  source              = "git::https://github.com/Mitya00/aws-terraform-finalmodule.git//vpc?ref=main"
  env                 = "dev"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_cidr            = "10.0.0.0/16"
  
  private_subnet_cidrs = ["10.0.4.0/24","10.0.3.0/24", "10.0.5.0/24"]
}

module "eks" {
  source = "git::https://github.com/Mitya00/aws-terraform-finalmodule.git//eks?ref=main"
env = "dev"
vpc_id = module.networking.vpc_id
privet_subnet_ids = module.networking.private_subnets
}

module "bastion" {
source = "git::https://github.com/Mitya00/aws-terraform-finalmodule.git//instance?ref=main"
env = "dev"
vpc_id = module.networking.vpc_id
public_subnet_ids = module.networking.public_subnets[0]
}
