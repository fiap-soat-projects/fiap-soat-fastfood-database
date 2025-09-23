variable "username" {
  description = "The username for the MongoDB user."
  type        = string
}

variable "password" {
  description = "The password for the MongoDB user."
  type        = string
  sensitive   = true
}

variable "atlas_project_id" {
  description = "The ID of the MongoDB Atlas project."
  type        = string
}

variable "role_name" {
  description = "The role assigned to the MongoDB user."
  type        = string
  default     = "readWrite"
}

variable "database_name" {
  description = "The database on which the role is applied."
  type        = string
}
