variable "prefix" {
  type    = string
  default = "prod"
}


variable "pub_key" {
  type        = string
  description = "your pub key"
}

variable "env" {
  type    = string
  default = "prod"
}
