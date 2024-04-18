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

resource "azurerm_network_security_group" "default" {
  name                = "nsg-${local.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

# resource "azurerm_network_security_rule" "allow_inbound_rdp" {
#   name                        = "AllowInboundRDP"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "1433"
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.default.name
# }
