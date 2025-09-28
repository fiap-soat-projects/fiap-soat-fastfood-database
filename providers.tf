terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "2.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.45.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "fiapsoatterraform"
    container_name       = "tfstate"
    key                  = "database/terraform.tfstate"
  }
}

provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}

provider "azurerm" {
  resource_provider_registrations = "none"
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  tenant_id                       = var.tenant_id
  subscription_id                 = var.subscription_id
  features {}
}
