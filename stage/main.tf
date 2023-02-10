module "vpc" {
     env = "stage"
    source = "git::https://github.com/ra1mova/terraform-aws-child.git//vpc?ref=main"
    vpc_cidr = var.vpc_cidr_block
    public_subnet_cidrs = slice(var.public_subnet_cidr_blocks, 10, 12)
    private_subnet_cidrs = slice(var.private_subnet_cidr_blocks, 7, 10)
}
module "eks" {
    source = "git::https://github.com/ra1mova/terraform-aws-child.git//eks?ref=main"
    env = "stage"
    vpc = module.vpc.vpc_id
    subnet = module.vpc.private_subnet_id
    cluster_name    = var.eks_name
    cluster_version = var.eks_version
    
    node_groups = {
    cluster1 = {
      node_group_name = "test3"
      desired_size    = 2
      max_size        = 2
      min_size        = 1

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