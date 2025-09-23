variable "atlas_project_id" {
  description = "The ID of the MongoDB Atlas project where the cluster will be created."
  type        = string
}

variable "name" {
  description = "The name of the cluster."
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
