provider "azurerm" {
  features {} # required
}

resource "azurerm_resource_group" "rg" {
  name     = "terraspace-backend"
  location = "eastus"
}
