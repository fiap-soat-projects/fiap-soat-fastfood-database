resource "mongodbatlas_project" "atlas_project" {
  org_id = var.atlas_organization_id
  name   = var.atlas_project_name
  tags   = var.tags
}
