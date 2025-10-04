data "terraform_remote_state" "atlas_database" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-prod"
    storage_account_name = "safiapsoatterraformprod"
    container_name       = "tfstate"
    key                  = "database/terraform.tfstate"
  }
}

data "terraform_remote_state" "aks_cluster" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-prod"
    storage_account_name = "safiapsoatterraformprod"
    container_name       = "tfstate"
    key                  = "infrastructure/terraform.tfstate"
  }
}
