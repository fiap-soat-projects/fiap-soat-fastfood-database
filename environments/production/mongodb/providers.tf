terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "2.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-prod"
    storage_account_name = "safiapsoatterraformprod"
    container_name       = "tfstate"
    key                  = "database/mongodb/terraform.tfstate"
  }
}

provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}
