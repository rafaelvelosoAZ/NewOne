terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-new-one"
    storage_account_name = "tfnewone"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
    subscription_id      = "27879557-aacc-4cbf-b226-16d05e5c026b"
  }
}
