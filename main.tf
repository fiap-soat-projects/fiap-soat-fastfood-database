terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "2.0.0"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}

# Create MongoDb Project
resource "mongodbatlas_project" "fastfood_project" {
  name   = var.atlas_project_name
  org_id = var.atlas_organization_id
  tags = {
    fiap = "soat-postech"
  }
}

# Create MongoDb Cluster
resource "mongodbatlas_cluster" "fastfood_cluster" {
  project_id                  = mongodbatlas_project.fastfood_project.id
  name                        = "fastfood-cluster"
  cluster_type                = "REPLICASET"
  provider_name               = "TENANT"
  backing_provider_name       = "AZURE"
  provider_region_name        = "US_EAST_2"
  provider_instance_size_name = "M0"
  mongo_db_major_version      = "7.0"
}

# Create MongoDb Database User
resource "mongodbatlas_database_user" "fastfood_user" {
  username           = var.mongodb_fastfood_username
  password           = var.mongodb_fastfood_password
  project_id         = mongodbatlas_project.fastfood_project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = var.mongodb_fastfood_database
  }
}

# Allow access from current IP
resource "mongodbatlas_project_ip_access_list" "user_ip" {
  project_id = mongodbatlas_project.fastfood_project.id
  ip_address = var.ip_address
}

# Initialize MongoDb Database
resource "null_resource" "init_fastfood_db" {
  depends_on = [
    mongodbatlas_cluster.fastfood_cluster,
    mongodbatlas_database_user.fastfood_user,
    mongodbatlas_project_ip_access_list.user_ip
  ]

  provisioner "local-exec" {
    environment = {
      MONGO_DB_NAME = var.mongodb_fastfood_database
    }

    command = "mongosh ${mongodbatlas_cluster.fastfood_cluster.connection_strings[0].standard_srv} --username ${var.mongodb_fastfood_username} --password ${var.mongodb_fastfood_password} --apiVersion 1 --file ./scripts/init-db.js"
  }
}
