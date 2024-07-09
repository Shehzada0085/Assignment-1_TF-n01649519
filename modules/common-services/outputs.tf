output "log_analytics_name" {
  value = var.log_analytics_name
}
output "recovery_vault_name" {
  value = var.recovery_vault_name
}
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
output "storage_account_uri" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}