module "vpc" {
    source = "git::https://github.com/abdisuhanova/modules.git//vpc?ref=main"
    public_subnets_count = 2
    private_subnets_count = 3
}

module "eks" {
    source = "git::https://github.com/abdisuhanova/modules.git//eks?ref=main"
    node_groups = { 
    cluster1 = { 
      node_group_name = "test" 
      desired_size    = 3 
      max_size        = 4 
      min_size        = 1
 
      ami_type       = "AL2_x86_64" 
    }
  }
  private_ids = module.vpc.private_ids
  public_ids = module.vpc.public_ids
  vpc_id = module.vpc.vpc_id
  instance_type = "t2.micro"
}

module "bastion" {
  source = "git::https://github.com/abdisuhanova/modules.git//ec2?ref=main"
  public_ids = module.vpc.public_ids
  vpc_id = module.vpc.vpc_id
}