provider "aws" {
  region = "us-west-2"
  
}
terraform {
  cloud {
    organization = "akzhol_aws"

    workspaces {
      name = "akzhol_tfstate"
    }
  }
}

module "vpc" {
  source                           = "git::https://github.com/AkzholS7/ChildModule.git//vpc?ref=main"
  availability_zones_count         = 2
  availability_zones_count_private = 3
  subnet_cidr_bits                 = 8
  project                          = "Akzhol"
  tagname_env                      = "dev"
}

module "eks" {
  source         = "git::https://github.com/AkzholS7/ChildModule.git//eks?ref=main"
  project        = "dev-eks"
  vpc_id         = module.vpc.vpc_id
  private_subnet = module.vpc.private_subnet_id


}

module "instance" {
  source         = "git::https://github.com/AkzholS7/ChildModule.git//instance?ref=main"
  public_subnets = module.vpc.public_subnet_id
  vpc_id         = module.vpc.vpc_id

}