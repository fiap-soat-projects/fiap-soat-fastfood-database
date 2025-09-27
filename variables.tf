variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "atlas_public_key" {
  description = "Public key for MongoDB Atlas"
  type        = string
}

variable "atlas_private_key" {
  description = "Private key for MongoDB Atlas"
  type        = string
}

variable "atlas_organization_id" {
  description = "Organization ID for MongoDB Atlas"
  type        = string
}

variable "mongodb_database_users" {
  description = "List of database users to create."
  type = map(object({
    username      = string
    password      = string
    role_name     = string
    database_name = string
  }))
}

variable "allowed_ips" {
  description = "List of IP addresses allowed to access the cluster."
  type        = list(string)
}
