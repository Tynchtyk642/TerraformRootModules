module "vpc" {
  source          = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//vpc?ref=zhakyp"
  network_name    = "zhakypsnetwork"
  nat_subnet_name = "privatesubnet3"
  subnets = [
    {
      subnet_name     = "privatesubnet1"
      subnet_ip_range = var.privatesubnet1
      subnet_region   = "us-west1"
    },
    {
      subnet_name           = "privatesubnet2"
      subnet_ip_range       = var.privatesubnet2
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
    {
      subnet_name           = "privatesubnet3"
      subnet_ip_range       = var.privatesubnet3
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
      {
      subnet_name           = "publicsubnet1"
      subnet_ip_range       = var.publicsubnet1
      subnet_region         = "us-west1"
      subnet_private_access = false
    },
    {
      subnet_name           = "publicsubnet2"
      subnet_ip_range       = var.publicsubnet2
      subnet_region         = "us-central1"
      subnet_private_access = false
    },

  ]
}

module "mssql" {
  source       = "git::https://github.com/Tynchtyk642/TerraformChildModules.git//cloud_sql?ref=zhakyp"
  network_name = module.vpc.network_name
  depends_on = [
    module.vpc.private_vpc_connection
  ]
}

