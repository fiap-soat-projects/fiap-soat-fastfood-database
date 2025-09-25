variable "project_id" {
  description = "The ID of the project in which to create the users."
  type        = string
}

variable "database_users" {
  description = "List of database users to create."
  type = map(object({
    username      = string
    password      = string
    role_name     = string
    database_name = string
  }))
}
