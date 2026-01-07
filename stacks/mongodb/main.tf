module "cluster" {
  source                = "../../modules/cluster"
  atlas_organization_id = var.atlas_organization_id
  atlas_project_name    = var.atlas_project_name
  cluster_name          = var.atlas_cluster_name
  tags                  = { fiap = "soat-postech" }
}

module "users" {
  source         = "../../modules/users"
  project_id     = module.cluster.project_id
  database_users = var.mongodb_database_users
}

module "allowed_ips" {
  source           = "../../modules/ip_access"
  atlas_project_id = module.cluster.project_id
  allowed_ips      = concat(var.allowed_ips, [local.executor_ip])
}

module "executor_order" {
  depends_on = [
    module.cluster,
    module.users,
    module.allowed_ips
  ]

  source        = "../../modules/executor"
  database_name = var.mongodb_database_users["order_user"].database_name
  command       = "mongosh ${module.cluster.connection_string} --username ${var.mongodb_database_users["order_user"].username} --password ${var.mongodb_database_users["order_user"].password} --apiVersion 1 --file ../../../scripts/init-order-db.js"
}

module "executor_payment" {
  depends_on = [
    module.cluster,
    module.users,
    module.allowed_ips
  ]

  source        = "../../modules/executor"
  database_name = var.mongodb_database_users["payment_user"].database_name
  command       = "mongosh ${module.cluster.connection_string} --username ${var.mongodb_database_users["payment_user"].username} --password ${var.mongodb_database_users["payment_user"].password} --apiVersion 1 --file ../../../scripts/init-payment-db.js"
}
