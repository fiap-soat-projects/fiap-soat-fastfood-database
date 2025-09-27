resource "mongodbatlas_database_user" "users" {
  for_each = var.database_users

  project_id         = var.project_id
  username           = each.value.username
  password           = each.value.password
  auth_database_name = "admin"
  roles {
    role_name     = each.value.role_name
    database_name = each.value.database_name
  }
}
