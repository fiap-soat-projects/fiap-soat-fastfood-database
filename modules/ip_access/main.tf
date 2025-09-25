resource "mongodbatlas_project_ip_access_list" "ip_access" {
  for_each = toset(var.allowed_ips)

  project_id = var.atlas_project_id
  ip_address = each.value
}
