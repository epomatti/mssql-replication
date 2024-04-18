resource "azurerm_virtual_network_peering" "source_to_destination" {
  name                      = "peer-src-to-dst"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.source_virtual_network_name
  remote_virtual_network_id = var.destination_virtual_network_id
}

resource "azurerm_virtual_network_peering" "destination_to_source" {
  name                      = "peer-dst-to-src"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.destination_virtual_network_name
  remote_virtual_network_id = var.source_virtual_network_id
}

resource "azurerm_virtual_network_peering" "source_to_private_endpoints" {
  name                      = "peer-src-to-pe"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.source_virtual_network_name
  remote_virtual_network_id = var.private_endpoints_virtual_network_id
}

resource "azurerm_virtual_network_peering" "private_endpoints_to_source" {
  name                      = "peer-pe-to-src"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.private_endpoints_virtual_network_name
  remote_virtual_network_id = var.source_virtual_network_id
}
