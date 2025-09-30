locals {
  atlas_project_name = "fastfood-project-prod"
  atlas_cluster_name = "fastfood-cluster-prod"
}

locals {
  executor_ip = chomp(data.http.current_ip.response_body)
}
