resource "azurerm_availability_set" "linux_avs" {
  name = var.linux_avs
  resource_group_name = var.resource_group_name
  location = var.location
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}
resource "azurerm_public_ip" "linux_pub_ip" {
  for_each = var.linux_vm_names
  name                = "${each.key}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
}
resource "azurerm_network_interface" "linux_net_interface" {
  for_each = var.linux_vm_names
  name                = "${each.key}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                         = "${each.key}-ipconfig"
    subnet_id                    = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id         = azurerm_public_ip.linux_pub_ip[each.key].id
  }
}
resource "azurerm_linux_virtual_machine" "linux_vms" {
  for_each            = var.linux_vm_names
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  availability_set_id = azurerm_availability_set.linux_avs.id
  network_interface_ids = [
    azurerm_network_interface.linux_net_interface[each.key].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.Offer
    sku       = var.sku
    version   = var.ver
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
  
}
resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each           = var.linux_vm_names
  name               = "${each.key}-NetworkWatcherExtension"
  virtual_machine_id = azurerm_linux_virtual_machine.linux_vms[each.key].id 
  publisher          = "Microsoft.Azure.NetworkWatcher"
  type               = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"

   protected_settings = <<PROTECTED_SETTINGS
    {}
  PROTECTED_SETTINGS

}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each           = var.linux_vm_names
  name               = "${each.key}-AzureMonitorExtension"
  virtual_machine_id = azurerm_linux_virtual_machine.linux_vms[each.key].id 
  publisher          = "Microsoft.Azure.Monitor"
  type               = "AzureMonitorLinuxAgent"
  type_handler_version = "1.9"

   protected_settings = <<PROTECTED_SETTINGS
    {}
  PROTECTED_SETTINGS

 
}
