variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "storage_account_uri" {
  type    = string
}
variable "nb_count" {
  type = number
  default = 1
}
variable "windows_avs" {
  type = string 
  default = "avs_set"
}
variable "windows_vm_name" {
  type = string
  default = "n01649519-win"
}
variable "win_admin_username" {
   type = string
   default = "n01649519"
}
variable "vm_size" {
  type = string
  default = "Standard_B1ms"
}

variable "win_admin_password" {
   type = string
   default = "Shehz@9519"
}
variable "windows_os_info" {
  type = object({
    publisher = string
    offer = string
    sku = string
    version = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
  }
}
variable "windows_os_disk" {
   type = object({
     disk_size = number
     storage_account_type = string
     caching = string
   })
   default = {
     disk_size = 128
     storage_account_type = "StandardSSD_LRS"
     caching = "ReadWrite"
   }
  
}