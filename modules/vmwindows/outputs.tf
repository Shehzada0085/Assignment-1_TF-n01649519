output "win_vm_hostname" {
  value = azurerm_windows_virtual_machine.windows_vm[*].name
}
output "win_vm_fqdn" {
  value = azurerm_public_ip.windows_pip[*].fqdn
}
output "win_public_ip" {
  depends_on = [ azurerm_windows_virtual_machine.windows_vm ]
  value = azurerm_public_ip.windows_pip[*].ip_address
}
output "win_private_ip" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}
output "win_vm_ids" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}