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
