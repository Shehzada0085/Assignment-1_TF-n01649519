resource "azurerm_public_ip" "lb_pip" {
  name                = "publicIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}


resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "BackEndAddressPool"
  loadbalancer_id     = azurerm_lb.lb.id
}

/*resource "azurerm_lb_probe" "lb_probe" {
  name                = "httpProbe"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = "HTTPRule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.lb_probe.id
}*/


resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool_association" {
  count               = 3
  network_interface_id = var.linux_vm_nic_ids[count.index]
  ip_configuration_name = var.ip_config_names[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}