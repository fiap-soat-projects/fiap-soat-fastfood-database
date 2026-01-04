variable "db_rg_name" {
  description = "Resource group name for PostgreSQL"
  type        = string
}

variable "db_resource_name" {
  description = "PostgreSQL resource name"
  type        = string
}

variable "db_location" {
  description = "Location for PostgreSQL resource"
  type        = string
  default     = "East US"
}

variable "db_admin_user" {
  description = "PostgreSQL admin user"
  type        = string
}

variable "db_admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "fastfood_customer_db"
}

variable "customer_app_user" {
  description = "Database user for the customer application"
  type        = string
}

variable "customer_app_password" {
  description = "Password for the customer application database user"
  type        = string
  sensitive   = true
}
