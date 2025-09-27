module "cluster" {
  source                = "./modules/cluster"
  atlas_organization_id = var.atlas_organization_id
  atlas_project_name    = "fastfood-project"
  cluster_name          = "fastfood-cluster"
  tags = {
    fiap = "soat-postech"
  }
}

module "users" {
  source         = "./modules/users"
  project_id     = module.cluster.project_id
  database_users = var.mongodb_database_users
}

module "ip_access" {
  source           = "./modules/ip_access"
  atlas_project_id = module.cluster.project_id
  allowed_ips      = var.allowed_ips
}

module "executor" {
  depends_on = [
    module.cluster,
    module.users,
    module.ip_access
  ]

  source        = "./modules/executor"
  database_name = var.mongodb_database_users["app_user"].database_name
  command       = "mongosh ${module.cluster.connection_string} --username ${var.mongodb_database_users["app_user"].username} --password ${var.mongodb_database_users["app_user"].password} --apiVersion 1 --file ./scripts/init-db.js"
}
