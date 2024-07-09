output "resource_group_name" {
  value = module.rgroup-n01649519.resource_group_name
}
output "virtual_network_name" {
  value = module.network-n01649519.virtual_network_name
}
output "subnet_name" {
  value = module.network-n01649519.subnet_name
}
output "log_analytics_name" {
  value = module.common-n01649519.log_analytics_name
}
output "recovery_vault_name" {
  value = module.common-n01649519.recovery_vault_name
}
output "storage_account_name" {
  value = module.common-n01649519.storage_account_name
}
output "linux_vms_hostname" {
  value = module.vmlinux-n01649519.linux_vms_hostname
}
output "linux_fqdn" {
  value = module.vmlinux-n01649519.linux_fqdn
}
output "linux_private_ip" {
  value = module.vmlinux-n01649519.linux_private_ip
}
output "linux_public_ip" {
  value = module.vmlinux-n01649519.linux_public_ip
}
output "win_vm_hostname" {
  value = module.vmwindows-n01649519.win_vm_hostname
}
output "win_vm_fqdn" {
  value = module.vmwindows-n01649519.win_vm_fqdn
}
output "win_public_ip" {
  value = module.vmwindows-n01649519.win_public_ip
}
output "win_private_ip" {
  value = module.vmwindows-n01649519.win_private_ip
}
output "lb_name" {
  value = module.load-balancer-n01649519.lb_name
}
output "db_name" {
  value = module.database-n01649519.db_name
}