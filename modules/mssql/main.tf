resource "azurerm_mssql_server" "default" {
  name                = "sqls-${var.workload}"
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = "12.0"
  minimum_tls_version = "1.2"

  public_network_access_enabled = var.public_network_access_enabled

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_password

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_database" "default" {
  name                 = "sqldb-${var.workload}"
  server_id            = azurerm_mssql_server.default.id
  max_size_gb          = var.max_size_gb
  read_scale           = false
  sku_name             = var.sku
  zone_redundant       = false
  storage_account_type = "Local"
}

resource "azurerm_mssql_firewall_rule" "local" {
  name             = "FirewallRuleLocal"
  server_id        = azurerm_mssql_server.default.id
  start_ip_address = var.public_ip_address_to_allow
  end_ip_address   = var.public_ip_address_to_allow
}

# Allow Azure Services to connect.
resource "azurerm_mssql_firewall_rule" "allow_access_to_azure_services" {
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.default.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Private Endpoint
resource "azurerm_private_dns_zone" "sql_server" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_server" {
  name                  = "sqlserver-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_server.name
  virtual_network_id    = var.private_endpoints_vnet_id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_server_source_vnet" {
  name                  = "sqlserver-source-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_server.name
  virtual_network_id    = var.source_vnet_id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_server_distributor_vnet" {
  name                  = "sqlserver-distributor-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_server.name
  virtual_network_id    = var.distributor_vnet_id
  registration_enabled  = true
}

resource "azurerm_private_endpoint" "sql_server" {
  name                = "pe-sqlserver"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoints_subnet_id

  private_dns_zone_group {
    name = azurerm_private_dns_zone.sql_server.name
    private_dns_zone_ids = [
      azurerm_private_dns_zone.sql_server.id
    ]
  }

  private_service_connection {
    name                           = "sql-server"
    private_connection_resource_id = azurerm_mssql_server.default.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
