variable "location" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "vm_mssql_source_admin_username" {
  type = string
}

variable "vm_mssql_distributor_admin_username" {
  type = string
}

variable "vm_mssql_destination_admin_username" {
  type = string
}

variable "vm_mssql_admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type = string
}

variable "vm_image_publisher" {
  type = string
}

variable "vm_image_offer" {
  type = string
}

variable "vm_image_sku" {
  type = string
}

variable "vm_image_version" {
  type = string
}

### Azure SQL Database ###
variable "mssql_sku" {
  type = string
}

variable "mssql_max_size_gb" {
  type = number
}

variable "mssql_public_network_access_enabled" {
  type = bool
}

variable "mssql_admin_login" {
  type = string
}

variable "mssql_admin_login_password" {
  type = string
}
