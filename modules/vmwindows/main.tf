resource "azurerm_availability_set" "win_avs" {
  name = var.windows_avs
  location = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}
resource "azurerm_public_ip" "windows_pip" {
  count               = var.nb_count
  name                = "${var.windows_vm_name}-${count.index}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.windows_vm_name}-${count.index}"
}
resource "azurerm_network_interface" "windows_nic" {
  count               = var.nb_count
  name                = "${var.windows_vm_name}${count.index}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = "${var.windows_vm_name}-${count.index}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[count.index].id
  }
}
resource "azurerm_windows_virtual_machine" "windows_vm" {
  count = var.nb_count
  name = "${var.windows_vm_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.win_admin_username
  availability_set_id = azurerm_availability_set.win_avs.id
  network_interface_ids = [
    azurerm_network_interface.windows_nic[count.index].id
  ]
  size = var.vm_size
  admin_password= var.win_admin_password
    os_disk {  
    name = "${count.index}-os-disk"  
    caching              = var.windows_os_disk.caching
    storage_account_type = var.windows_os_disk.storage_account_type
    disk_size_gb = var.windows_os_disk.disk_size
  }

  source_image_reference {
    publisher = var.windows_os_info.publisher
    offer     = var.windows_os_info.offer
    sku       = var.windows_os_info.sku
    version   = var.windows_os_info.version
  }

  winrm_listener {
    protocol = "Http"
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}
resource "azurerm_virtual_machine_extension" "antimalware" {
  count = var.nb_count
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm[count.index].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
      "AntimalwareEnabled": true,
      "Exclusions": {
        "Extensions": ".log;.ldf;.mdf"
      }
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
    }
  PROTECTED_SETTINGS
}