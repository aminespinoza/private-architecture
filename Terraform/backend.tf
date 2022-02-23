terraform {
  backend "azurerm" {
    storage_account_name = "generastorageamin"
    container_name       = "privatearchstate"
    key                  = "dev.tfstate"
  }
}