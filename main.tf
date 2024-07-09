variable "location" {
  type    = string
  default = "Canada Central"
}
module "rgroup-n01649519" {
  source   = "./modules/resource_group"
  location = var.location
}
module "network-n01649519" {
  source              = "./modules/network"
  resource_group_name = module.rgroup-n01649519.resource_group_name
  location            = var.location
  depends_on = [ module.rgroup-n01649519 ]
}
module "common-n01649519" {
    source = "./modules/common-services"
    location = var.location
    resource_group_name = module.rgroup-n01649519.resource_group_name
    depends_on = [ module.rgroup-n01649519 ]
}
module "vmlinux-n01649519" {
  source = "./modules/vmlinux"
  location = var.location
  resource_group_name = module.rgroup-n01649519.resource_group_name
  subnet_id = module.network-n01649519.subnet_id
  storage_account_uri = module.common-n01649519.storage_account_uri
  depends_on = [ module.network-n01649519.subnet ]
}
module "vmwindows-n01649519" {
  source = "./modules/vmwindows"
  location = var.location
  resource_group_name = module.rgroup-n01649519.resource_group_name
  subnet_id = module.network-n01649519.subnet_id
  storage_account_uri = module.common-n01649519.storage_account_uri
  depends_on = [ module.network-n01649519.subnet ]
}
module "data_disk-n01649519" {
  source = "./modules/data-disk"
  resource_group_name = module.rgroup-n01649519.resource_group_name
  location = var.location
  linux_vm_ids = module.vmlinux-n01649519.linux_vm_ids
  win_vm_ids = module.vmwindows-n01649519.win_vm_ids
  depends_on = [ module.vmlinux-n01649519.linux_vms, module.vmwindows-n01649519.windows_vm ]
}
module "load-balancer-n01649519" {
  source = "./modules/load_balancer"
  resource_group_name = module.rgroup-n01649519.resource_group_name
  location = var.location
  linux_vm_nic_ids = module.vmlinux-n01649519.linux_vm_nic_ids
  ip_config_names = module.vmlinux-n01649519.linux_nic_names
  depends_on = [ module.rgroup-n01649519, module.vmlinux-n01649519 ]
}
module "database-n01649519" {
  source = "./modules/database"
  resource_group_name = module.rgroup-n01649519.resource_group_name
  location = var.location
  depends_on = [module.rgroup-n01649519 ]
}