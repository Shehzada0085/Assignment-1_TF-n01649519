variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "virtual_network_name" {
  type    = string
  default = "9519-vnet"
}
variable "virtual_network_address" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet_name" {
  type    = string
  default = "9519-subnet"
}
variable "subnet_address" {
  type    = string
  default = "10.0.0.0/24"
}
variable "nsg_name" {
  type    = string
  default = "9519-nsg"
}