variable "atlas_project_id" {
  description = "The ID of the MongoDB Atlas project where the cluster will be created."
  type        = string
}

variable "ip_address" {
  description = "The IP address or CIDR block to be added to the IP access list."
  type        = string
}