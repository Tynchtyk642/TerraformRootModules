
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
  
}


module "vpc" {
  source                           = "git::https://github.com/KylychbekEraliev/final_exam.git//vpc?ref=main"
  public_subnet                    = ["10.0.2.0/24","10.0.22.0/24","10.0.44.0/24"]
  private_subnet                   = ["10.0.1.0/24","10.0.11.0/24"]
  subnet_cidr_bits                 = 8
  project                          = "Kylychbek"
  environment                      = "dev"
}

module "eks" {
    source = "git::https://github.com/KylychbekEraliev/final_exam.git//eks?ref=main"
    private_ids = module.vpc.private_ids
    public_ids = module.vpc.public_ids
    vpc_id = module.vpc.vpc_id

  
}


module "bastion" {
    source = "git::https://github.com/KylychbekEraliev/final_exam.git//instance?ref=main"
    vpc_subnet_id = module.vpc.public_ids[0]



  
}


