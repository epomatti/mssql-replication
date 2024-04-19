location = "brazilsouth"

allowed_ip_address = ""

vm_mssql_source_admin_username      = "sqlsrc"
vm_mssql_distributor_admin_username = "sqldist"
vm_mssql_destination_admin_username = "sqldest"
vm_mssql_admin_password             = "P@ssw0rd.123"

vm_size = "Standard_B4as_v2"

vm_image_publisher = "MicrosoftWindowsServer"
vm_image_offer     = "WindowsServer"
vm_image_sku       = "2022-datacenter-g2"
vm_image_version   = "latest"

# Azure SQL Database
mssql_public_network_access_enabled = true
mssql_sku                           = "Basic"
mssql_max_size_gb                   = 2
mssql_admin_login                   = "sqladmin"
mssql_admin_login_password          = "P@ssw0rd.123"
