variable "project_id" {
  type        = string
  description = "The ID of the project to create resources in"
}

variable "region" {
  type        = string
  description = "The region to use"
}

variable "cluster_node_zones" {
  type        = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}

variable "service_account" {
  type        = string
  description = "The GCP service account"
}

variable "sql_region" {
  type        = string
  description = "Region for SQL, I want to deploy SQL in different region from GKE "
}

variable "zone" {
  type        = string
  description = "zone for read replica"
}

