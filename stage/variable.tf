variable "eks_name" {
  description = "EKS Cluster name."
  type        = string
  default     = "EKS"
}

variable "eks_version" {
  description = "EKS Cluster version."
  type        = string
  default     = "1.24"
}

variable "node_groups" {
  type    = any
  description = "Cluster Node Group"
  default = {}
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}
variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
    "10.1.1.0/24",
    "10.1.2.0/24",
    "10.1.3.0/24",
    "10.1.4.0/24",
    "10.1.5.0/24",
    "10.1.6.0/24",
    "10.1.7.0/24",
    "10.1.8.0/24",
    "10.1.9.0/24",
    "10.1.10.0/24",
    "10.1.11.0/24",
    "10.1.12.0/24",
    "10.1.13.0/24",
    "10.1.14.0/24",
    "10.1.15.0/24",
    "10.1.16.0/24"
  ]
}
variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "10.1.101.0/24",
    "10.1.102.0/24",
    "10.1.103.0/24",
    "10.1.104.0/24",
    "10.1.105.0/24",
    "10.1.106.0/24",
    "10.1.107.0/24",
    "10.1.108.0/24",
    "10.1.109.0/24",
    "10.1.110.0/24",
    "10.1.111.0/24",
    "10.1.112.0/24",
    "10.1.113.0/24",
    "10.1.114.0/24",
    "10.1.115.0/24",
    "10.1.116.0/24"
  ]
}