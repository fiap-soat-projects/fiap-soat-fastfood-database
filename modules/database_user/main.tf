resource "mongodbatlas_database_user" "user" {
  username           = var.username
  password           = var.password
  project_id         = var.atlas_project_id
  auth_database_name = "admin"
  roles {
    role_name     = var.role_name
    database_name = var.database_name
  }
}
