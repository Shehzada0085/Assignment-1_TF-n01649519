variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "data_disk_name" {
  type = string
  default = "n01649519-datadisk"
}
variable "disk_count" {
  type = number
  default = 4
}
variable "linux_vm_ids" {
  type = list(string)
}
variable "win_vm_ids" {
  type = list(string)
}
