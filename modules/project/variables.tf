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
