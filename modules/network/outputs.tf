output "virtual_network_name" {
  value = var.virtual_network_name
}
output "subnet_name" {
  value = var.subnet_name
}
output "subnet_id" {
  value = azurerm_subnet.sub.id
}