variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}
variable "db_name" {
  type = string
  default = "n01649519-postgresql"
}
variable "db_admin_username" {
  type = string
  default = "n01649519adminpsql"
}

variable "db_admin_password" {
  type = string
  default = "Shehz@0085"
}

/*variable "tags" {
  description = "A map of tags to be applied to the resources"
  type        = map(string)
}*/

variable "postgresql_version" {
  type = string
  default = "11"
}

variable "ssl_enforcement_enabled" {
  type = bool
  default = "true"
}