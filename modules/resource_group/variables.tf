variable "resource_group_name" {
  type    = string
  default = "9519-RG"
}
variable "location" {
  type    = string
  default = "Canada Central"
}
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Shehzada.Shaikh"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}