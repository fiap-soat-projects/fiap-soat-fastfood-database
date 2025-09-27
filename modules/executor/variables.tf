variable "database_name" {
  description = "The name of the database execute the script."
  type        = string
}

variable "command" {
  description = "The command to be executed by the local-exec provisioner."
  type        = string
  sensitive = true
}
