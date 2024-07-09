resource "null_resource" "null_hostname" {
  for_each      = var.linux_vm_names
  depends_on = [azurerm_linux_virtual_machine.linux_vms]
  provisioner "remote-exec" {
    inline = ["echo 'Hostname:'`hostname`"]
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.linux_pub_ip[each.key].fqdn
      user        = var.admin_username
      private_key = file(var.private_key)
    }
  }
}