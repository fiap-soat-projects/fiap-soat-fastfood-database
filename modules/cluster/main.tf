resource "mongodbatlas_project" "project" {
  org_id = var.atlas_organization_id
  name   = var.atlas_project_name
  tags   = var.tags
}

resource "mongodbatlas_cluster" "cluster" {
  project_id                  = mongodbatlas_project.project.id
  name                        = var.cluster_name
  cluster_type                = "REPLICASET"
  provider_name               = "TENANT"
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = "M0"
  mongo_db_major_version      = "7.0"
}
