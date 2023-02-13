output "vpc_ids" {
  value       = module.vpc_prod.vpc_id
  description = "Indentification of VPC"
}

output "subnets_ids" {
  value       = module.vpc_prod.public_subnet_ids
  description = "Identification of subnet"
}

output "private-subnet-id" {
  value       = module.vpc_prod.private-subnet-id
  description = "Identification of private subnet"
}
