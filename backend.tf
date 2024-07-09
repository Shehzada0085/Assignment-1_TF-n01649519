terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01649519RG"
    storage_account_name = "tfstaten01649519sa"
    container_name       = "tfstatefiles"
    key                  = "assignment-1.tfstate"
  }
}
