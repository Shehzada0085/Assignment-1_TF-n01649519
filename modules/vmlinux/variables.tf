variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "linux_avs" {
  type = string
  default = "9519-linux-avs"
}
variable "linux_vm_names" {
   type = object({
     n01649519-linux-vm1 = string
     n01649519-linux-vm2 = string
     n01649519-linux-vm3 = string
   })
   default = {
     n01649519-linux-vm1 = "vm1"
     n01649519-linux-vm2 = "vm2"
     n01649519-linux-vm3 = "vm3"
   }
}
  
variable "size" {
  type = string
  default = "Standard_B1ms"
}
variable "admin_username" {
  type    = string
  default = "n01649519"
}

variable "public_key" {
  type    = string
  default = "/Users/n01649519/.ssh/id_rsa.pub"
}
variable "private_key" {
  type    = string
  default = "/Users/n01649519/.ssh/id_rsa"
}

variable "storage_account_uri" {
  type    = string
}
variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
}

variable "disk_size" {
  type    = string
  default = "32"
}

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "publisher" {
  type    = string
  default = "OpenLogic"
}

variable "Offer" {
  type    = string
  default = "CentOS"
}

variable "sku" {
  type    = string
  default = "8_2"
}

variable "ver" {
  type    = string
  default = "latest"
}
