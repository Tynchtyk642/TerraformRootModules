output "network" {
  value = module.vpc.network
  
}

output "subnet_name" {
  value = module.vpc.private_subnet
}

output "cluster_pods_ip_cidr_range" {
  value = module.vpc.cluster_pods_ip_cidr_range
}

output "cluster_services_ip_cidr_range" {
  value = module.vpc.cluster_services_ip_cidr_range
}

output "cluster_master_ip_cidr_range" {
  value = module.vpc.cluster_master_ip_cidr_range
}