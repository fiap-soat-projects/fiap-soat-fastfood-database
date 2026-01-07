module "k8s_access" {
  source           = "../../../modules/ip_access"
  atlas_project_id = data.terraform_remote_state.atlas_database.outputs.project_id
  allowed_ips      = [data.terraform_remote_state.aks_cluster.outputs.aks_ip]
}
