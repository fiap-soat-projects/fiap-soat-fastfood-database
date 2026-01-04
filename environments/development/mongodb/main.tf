module "mongodb" {
  source                 = "../../../stacks/mongodb"
  atlas_organization_id  = var.atlas_organization_id
  atlas_public_key       = var.atlas_public_key
  atlas_private_key      = var.atlas_private_key
  allowed_ips            = var.allowed_ips
  mongodb_database_users = var.mongodb_database_users

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
