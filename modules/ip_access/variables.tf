variable "atlas_project_id" {
  description = "The ID of the MongoDB Atlas project where the cluster will be created."
  type        = string
}

variable "allowed_ips" {
  description = "List of IP addresses allowed to access the cluster."
  type        = list(string)
}