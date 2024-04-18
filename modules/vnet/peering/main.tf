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