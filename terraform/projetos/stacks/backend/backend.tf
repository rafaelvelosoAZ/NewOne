terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-resources-eastus"
    storage_account_name = "ts6b0eeastusdev"
    container_name       = "terraform-state"
    key                  = "terra.tfstate"
    subscription_id      = "27879557-aacc-4cbf-b226-16d05e5c026b"
  }
}
