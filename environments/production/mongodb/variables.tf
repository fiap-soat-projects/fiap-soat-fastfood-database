variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Azure AppID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure App Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure TenantID"
  type        = string
  sensitive   = true
}

variable "atlas_public_key" {
  description = "Public key for MongoDB Atlas"
  type        = string
}

variable "atlas_private_key" {
  description = "Private key for MongoDB Atlas"
  type        = string
}

variable "atlas_project_name" {
  description = "Project name for MongoDB Atlas"
  type        = string
  default     = "fastfood-project-prod"
}

variable "atlas_cluster_name" {
  description = "Cluster name for MongoDB Atlas"
  type        = string
  default     = "fastfood-cluster-prod"
}

variable "atlas_organization_id" {
  description = "Organization ID for MongoDB Atlas"
  type        = string
}

variable "mongodb_database_users" {
  description = "List of database users to create"
  type = map(object({
    username      = string
    password      = string
    role_name     = string
    database_name = string
  }))
}

variable "allowed_ips" {
  description = "List of IP addresses allowed to access the cluster"
  type        = list(string)
  default     = []
}
