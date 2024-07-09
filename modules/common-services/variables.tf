variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "log_analytics_name" {
  type =string
  default = "log-analytics"
}
variable "recovery_vault_name" {
  type = string
  default = "recovery-vault"
}
variable "storage_account_name" {
  type = string
  default = "9519sanjy"
}
