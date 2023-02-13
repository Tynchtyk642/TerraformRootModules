module "vpc" {
    source = "../../child_moduls/vpc"
    project = "dev"


    vpc_cidr = "10.0.0.0/16"
}
terraform {
  cloud {
    organization = "karybekov"

    workspaces {
      name = "tfstate1"
    }
  }
}
module "eks" {
    source = "../../child_moduls/eks"
    vpc_id = module.vpc.vpc_id
    subnet_public_id = module.vpc.subnet_public_id
    subnet_private_id = module.vpc.subnet_private_id
    project ="dev"
    
    depends_on = [module.vpc]
}

module "instance" {
    source = "../../child_moduls/instance"
    subnet_id = module.vpc.subnet_public_id[1]
}



