terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

resource "random_string" "affix" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

locals {
  allowed_ip_addresses = [var.allowed_ip_address]
}

resource "azurerm_resource_group" "default" {
  name     = "rg-mssql-migration"
  location = var.location
}

module "vnet_source" {
  source              = "./modules/vnet/source"
  location            = var.location
  resource_group_name = azurerm_resource_group.default.name
  allowed_ip_address  = var.allowed_ip_address
}

module "vnet_destination" {
  source              = "./modules/vnet/destination"
  location            = var.location
  resource_group_name = azurerm_resource_group.default.name
  allowed_ip_address  = var.allowed_ip_address
}

module "vnet_peering" {
  source                           = "./modules/vnet/peering"
  resource_group_name              = azurerm_resource_group.default.name
  source_virtual_network_id        = module.vnet_source.vnet_id
  destination_virtual_network_id   = module.vnet_destination.vnet_id
  source_virtual_network_name      = module.vnet_source.name
  destination_virtual_network_name = module.vnet_destination.name
}


module "vm_sqlserver_source" {
  source              = "./modules/vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.default.name
  workload            = "mssql-source"

  subnet_id = module.vnet_source.subnet_id
  size      = var.vm_size

  admin_username = var.vm_mssql_source_admin_username
  admin_password = var.vm_mssql_admin_password

  image_publisher = var.vm_image_publisher
  image_offer     = var.vm_image_offer
  image_sku       = var.vm_image_sku
  image_version   = var.vm_image_version
}

