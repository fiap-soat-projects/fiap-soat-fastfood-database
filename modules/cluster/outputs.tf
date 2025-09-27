output "project_id" {
  description = "The ID of the created project."
  value       = mongodbatlas_project.project.id
}

output "connection_string" {
  description = "The standard SRV connection string for the cluster."
  value       = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
}
