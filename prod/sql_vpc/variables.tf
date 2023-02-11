variable "privatesubnet1" {
  description = "IP range of Private subnetwork"
  type        = string
  default     = "10.100.0.0/16"
}

variable "privatesubnet2" {
  description = "IP range of Private subnetwork"
  type        = string
  default     = "10.101.0.0/16"
}

variable "privatesubnet3" {
  description = "IP range of Private subnetwork"
  type        = string
  default     = "10.102.0.0/16"
}

variable "publicsubnet1" {
  description = "IP range of Public subnetwork"
  type        = string
  default     = "10.1.0.0/24"
}

variable "publicsubnet2" {
  description = "IP range of Public subnetwork"
  type        = string
  default     = "10.104.0.0/24"
}