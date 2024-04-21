data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-mukesh"
}

resource "azurerm_mssql_server" "dbserver_todoapp" {
  name                         = var.dbservername
  resource_group_name          = data.azurerm_resource_group.rg-todoApp.name
  location                     = data.azurerm_resource_group.rg-todoApp.location
  version                      = var.dbserverversion
  administrator_login          = var.dbadmin
  administrator_login_password = var.dbadminpwd
  minimum_tls_version          = var.tlsversion
  
  tags = {
    environment = "development"
  }
}