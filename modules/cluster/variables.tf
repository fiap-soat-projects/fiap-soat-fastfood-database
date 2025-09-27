variable "atlas_project_name" {
  description = "Name of the MongoDB Atlas project"
  type        = string
}

variable "atlas_organization_id" {
  description = "ID of the MongoDB Atlas organization"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the MongoDB Atlas project"
  type        = map(string)
  default     = {}
}

variable "cluster_name" {
  description = "Name of the MongoDB Atlas cluster"
  type        = string
}

variable "backing_provider_name" {
  description = "The cloud provider for the cluster."
  type        = string
  default     = "AZURE"
}

variable "provider_region_name" {
  description = "The region where the cluster will be deployed."
  type        = string
  default     = "US_EAST_2"
}
