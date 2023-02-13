output "vpc_ids" {
  value       = module.vpc_dev.vpc_id
  description = "Indentification of VPC"
}

output "subnets_ids" {
  value       = module.vpc_dev.public_subnet_ids
  description = "Identification of subnet"
}

output "private-subnet-id" {
  value       = module.vpc_dev.private-subnet-id
  description = "Identification of private subnet"
}
