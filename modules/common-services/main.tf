resource "azurerm_log_analytics_workspace" "log_analytics_ws" {
  resource_group_name = var.resource_group_name
  location = var.location
  name = var.log_analytics_name
  sku = "PerGB2018"
}
resource "azurerm_recovery_services_vault" "recovery_vault" {
  name = var.recovery_vault_name
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"
}
resource "azurerm_storage_account" "storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}