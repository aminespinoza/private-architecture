resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurecaf_name" "vnet_name" {
  name          = "tst"
  resource_type = "azurerm_virtual_network"
  prefixes      = [var.prefix]
  suffixes      = [azurerm_resource_group.rg.location]
  random_length = 3
  clean_input   = true
}

resource "azurerm_virtual_network" "vnet" {
  name                = azurecaf_name.vnet_name.result
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "default"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "pte-subnet"
    address_prefix = "10.0.1.0/27"
  }

  subnet {
    name = "gateway-subnet"
    address_prefix = "10.0.2.0/24"
  }
}