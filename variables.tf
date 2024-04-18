variable "location" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "vm_mssql_source_admin_username" {
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
