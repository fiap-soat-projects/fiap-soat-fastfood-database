module "project" {
  source                = "./modules/project"
  atlas_organization_id = var.atlas_organization_id
  atlas_project_name    = "fastfood-project"
  tags = {
    fiap = "soat-postech"
  }

  providers = { 
    mongodbatlas = mongodbatlas 
  }
}

module "cluster" {
  source           = "./modules/cluster"
  atlas_project_id = module.project.project_id
  name             = "fastfood-cluster"

  providers = { 
    mongodbatlas = mongodbatlas 
  }
}

module "user" {
  source           = "./modules/database_user"
  atlas_project_id = module.project.project_id
  database_name    = var.mongodb_fastfood_databasename
  username         = var.mongodb_fastfood_username
  password         = var.mongodb_fastfood_password

  providers = { 
    mongodbatlas = mongodbatlas 
  }
}

module "ip_access_list" {
  source           = "./modules/ip_access"
  atlas_project_id = module.project.project_id
  ip_address       = var.ip_address

  providers = { 
    mongodbatlas = mongodbatlas 
  }
}

resource "null_resource" "init_db" {
  depends_on = [
    module.cluster,
    module.user,
    module.ip_access_list
  ]

  provisioner "local-exec" {
    environment = {
      MONGO_DB_NAME = var.mongodb_fastfood_databasename
    }

    command = "mongosh ${module.cluster.connection_string} --username ${var.mongodb_fastfood_username} --password ${var.mongodb_fastfood_password} --apiVersion 1 --file ./scripts/init-db.js"
  }
}
