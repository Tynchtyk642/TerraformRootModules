variable "public_subnet" {
    default = ["10.2.0.0/24", "10.2.1.0/24"  ]
    description = "Assigning CIDR for the public subnets"
}
variable "private_subnet" {
    default = ["10.2.3.0/24", "10.2.4.0/24", "10.2.5.0/24" ]
    description = "Assigning CIDR for the private subnet"
  
}
variable "vpc" {
  default =  "10.2.0.0/16"
  description = "Assigning CIDR for the vpc"
}