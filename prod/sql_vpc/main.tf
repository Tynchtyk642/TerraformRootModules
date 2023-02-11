module "vpc" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc?ref=lunara"

  source_ranges = var.source_range
  subnets = var.subnetworks
}

module "gke" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//gke?ref=lunara"

  network_name   = module.vpc.vpc
  private_subnet = module.vpc.subnets["subnet3"]
  cluster_name = "prod-cluster-lunara"
}

module "sql" {
  source = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud_sql?ref=lunara"

  private_network = module.vpc.vpc
  depends_on      = [module.vpc.private_vpc_connection]
  read_replicas = var.replicas
  password = var.passwd
}