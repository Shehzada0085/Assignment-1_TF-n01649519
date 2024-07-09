output "linux_vms_hostname" {
  value = [for key in var.linux_vm_names:key ]
}
output "linux_fqdn" {
  value = { for key, pip in azurerm_public_ip.linux_pub_ip : key => pip.fqdn}
}

output "linux_private_ip" {
  value = { for key, nic in azurerm_network_interface.linux_net_interface : key => nic.private_ip_address }
}

output "linux_public_ip" {
  depends_on = [ azurerm_linux_virtual_machine.linux_vms ]
  value = { for key, pip in azurerm_public_ip.linux_pub_ip : key => pip.ip_address }
}
output "linux_vm_ids" {
 value = [for vm in azurerm_linux_virtual_machine.linux_vms : vm.id]
}
output "linux_vm_nic_ids" {
  value = [for nic in azurerm_network_interface.linux_net_interface: nic.id]
}
output "linux_nic_names" {
  value = [for x, nic in azurerm_network_interface.linux_net_interface : nic.ip_configuration[0].name]
}
