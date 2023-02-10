module "nuriza" {
  source = "git::https://github.com/PaishankyzyNuriza/final_child_modules.git//vpc"
  env    = "nuri"
  public_subnets_count = 2
  private_subnets_count = 3
}

module "eks" {
  source = "git::https://github.com/PaishankyzyNuriza/final_child_modules.git//eks"
  node_groups = {
    cluster1 = {
      node_group_name = "test"
      desired_size    = 2
      max_size        = 3
      min_size        = 1

      ami_type = "AL2_x86_64"
    }
  }
  private_ids   = module.nuriza.private_ids
  public_ids    = module.nuriza.public_ids
  vpc_id        = module.nuriza.vpc_id
  user_data     = "userdata.sh"
  instance_type = "t2.micro"
}
module "instance" {
  source     = "git::https://github.com/PaishankyzyNuriza/final_child_modules.git//instance"
  env        = "nuriza"
  public_ids = module.nuriza.public_ids
  vpc_id     = module.nuriza.vpc_id
}