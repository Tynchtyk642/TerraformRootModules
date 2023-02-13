provider "aws" {
  region = "eu-central-1"
}


terraform {
  backend "remote" {
    organization = "terraform-cloud-dev"

    workspaces {
      name = "dev-project"
    }
  }
}



module "vpc_dev" {
  source                     = "git::https://github.com/nazeekesen016/modules.git//vpc?ref=main"
  vpc-cidr-block             = "10.5.0.0/16"
  subnets-cidr-block         = ["10.5.1.0/24", "10.5.2.0/24"]
  private-subnets-cidr-block = ["10.5.4.0/24", "10.5.5.0/24", "10.5.6.0/24", ]
  private-subnet-id          = module.vpc_dev.private-subnet-id
  vpc_id                     = module.vpc_dev.vpc_id
  env                        = "dev"
}

module "dev-eks" {
  source             = "git::https://github.com/nazeekesen016/modules.git//eks?ref=main"
  env                = "dev"
  private-subnet-ids = module.vpc_dev.private-subnet-id
  vpc_id             = module.vpc_dev.vpc_id

}

module "instance" {
  source        = "git::https://github.com/nazeekesen016/modules.git//instance?ref=main"
  vpc-id        = module.vpc_dev.vpc_id
  subnet_id     = module.vpc_dev.public_subnet_ids
  env           = "dev"
  instance-type = "t3.micro"
}
