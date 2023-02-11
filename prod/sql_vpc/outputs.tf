output "network" {
  value = module.vpc.vpc
}

output "subnetworks" {
  value = module.vpc.subnets["subnet3"]
}