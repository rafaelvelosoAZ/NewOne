terraform {
  backend "azurerm" {
    resource_group_name  = "newone"
    storage_account_name = "newonestg"
    container_name       = "terraform-states"
    key                  = "terraform.tfstate"
    subscription_id      = "27879557-aacc-4cbf-b226-16d05e5c026b"
  }
}
