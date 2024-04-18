output "vnet_id" {
  value = azurerm_virtual_network.default.id
}

output "name" {
  value = azurerm_virtual_network.default.name
}

output "subnet_id" {
  value = azurerm_subnet.default.id
}
