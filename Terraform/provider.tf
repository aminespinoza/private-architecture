provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.10"
    }
  }
}