variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "lb_name" {
  type = string
  default = "n01649519-lb"
}
variable "backend_lb_name" {
  type = string
  default = "n01649519-backend-lb"
}
variable "linux_vm_nic_ids" {
  type = list(string)
}

variable "ip_config_names" {
  type = list(string)
}