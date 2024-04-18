locals {
  environment        = "private-endpoints"
  address            = "10.55.0.0"
  vnet_address_space = ["${local.address}/16"]
  subnet_addresses   = ["${local.address}/24"]
}

resource "azurerm_virtual_network" "default" {
  name                = "vnet-${local.environment}"
  address_space       = local.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "default" {
  name                 = "subnet-${local.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = local.subnet_addresses
}
