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

variable "mongodb_fastfood_databasename" {
  description = "Name of the MongoDB Fastfood database"
  type        = string
}

variable "mongodb_fastfood_username" {
  description = "Username for MongoDB Fastfood database"
  type        = string
}

variable "mongodb_fastfood_password" {
  description = "Password for MongoDB Fastfood database"
  type        = string
  sensitive   = true
}

variable "ip_address" {
  description = "Current IP address to allow access to MongoDB Atlas"
  type        = string
}
