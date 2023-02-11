terraform {
  cloud {
    organization = "nazimmuhtarbekov73"

    workspaces {
      name = "final-project-terraform"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_key_pair" "deployer" {
  key_name   = var.prefix
  public_key = var.pub_key

  tags = {
    Name = "${var.prefix}-key-pair"
  }
}
module "vpc" {
  source =  "git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc?ref=nazim"

  prefix          = var.prefix
  vpc_cidr_block  = "192.168.0.0/16"
  public_subnets  = 2
  private_subnets = 3
  public_cidrs    = ["192.168.1.0/24", "192.168.2.0/24"]
  private_cidrs   = ["192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24"]
  env_tag         = var.env
}

module "eks" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//eks?ref=nazim"
  
  
  cluster_name  = "${var.env}-eks"
  prefix        = var.prefix
  subnet_ids    = module.vpc.private_subnets
  vpc_id        = module.vpc.vpc_id
  instance_type = "t3.micro"
  key_name = aws_key_pair.deployer.key_name
}

module "bastion" {
  source =  "git::https://github.com/Tynchtyk642/TerraformChildModules.git//instance?ref=nazim"

  ami = data.aws_ami.ubuntu.id
  prefix    = var.prefix
  subnet_id = module.vpc.public_subnets[0]
  key_name  = aws_key_pair.deployer.key_name
  sg_vpc_id = module.vpc.vpc_id
}
