resource "mongodbatlas_cluster" "atlas_cluster" {
  project_id                  = var.atlas_project_id
  name                        = var.name
  cluster_type                = "REPLICASET"
  provider_name               = "TENANT"
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = "M0"
  mongo_db_major_version      = "7.0"
}
