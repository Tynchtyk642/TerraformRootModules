output "vpc_network_name" {
  value = module.vpc.network_name
  
}

output "subnet_name" {
  value = module.vpc.subnet_name[4]
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