module "postgres" {
  source                = "../../../stacks/postgres"
  db_rg_name            = var.db_rg_name
  db_resource_name      = var.db_resource_name
  db_location           = var.db_location
  db_admin_user         = var.db_admin_user
  db_admin_password     = var.db_admin_password
  db_name               = var.db_name
  customer_app_user     = var.customer_app_user
  customer_app_password = var.customer_app_password
}
