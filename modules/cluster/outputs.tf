output "connection_string" {
  description = "The standard SRV connection string for the cluster."
  value       = mongodbatlas_cluster.atlas_cluster.connection_strings[0].standard_srv
}
