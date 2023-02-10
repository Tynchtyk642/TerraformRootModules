
locals {
  instance_os = "ubuntu"
}
module "vpc" {
  source = "../child_module/vpc"


}
# module "instance" {
#   source         = "../child_module/instance"
#   instance_count = 2
#   subnet_id      = module.vpc.public_subnet[0].id
#   name           = "final"
#   vpc_id         = module.vpc.vpc-id
#   ami            = local.instance_os == "ubuntu" ? data.aws_ami.ubuntu.id : data.aws_ami.amazon_linux.id
# }

module "eks" {
  source = "../child_module/eks"
  public_subnets_id = module.vpc.public_subnets_id
  private_subnets_id = module.vpc.private_subnets_id
  security_groups_id = module.vpc.security_groups_id
  security_group_id = element(module.vpc.security_groups_id,0)
  ami = data.aws_ami.ubuntu.id


}

##################################################################################################################################
# AMI DATA SOURCE
##################################################################################################################################

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

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}


