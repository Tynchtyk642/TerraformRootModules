module "vpc" {
  source = "git::https://github.com/NurdaCodez/sourcer.git//module/vpc?ref=main"

  region = var.region
  project_id = var.project_id
}

module "cloud-sql" {
  source         = "git::https://github.com/NurdaCodez/sourcer.git//module/cloud-sql?ref=main"

  network_name   = module.vpc.network
  sql_region     = "europe-north1"
  zone           = "europe-north1-a"
  db_depends_on  = module.vpc.google_service_networking_connection
}


module "instance" {
  source         = "git::https://github.com/NurdaCodez/sourcer.git//module/instance?ref=main"

  network        = module.vpc.network
  subnetwork     = module.vpc.public_subnet.name
  ins_depends_on = module.vpc.public_subnet.name
} 

