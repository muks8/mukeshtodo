data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-mukesh"
}
resource "azurerm_sql_database" "db_todoapp" {
  name                = var.dbname
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
  location            = data.azurerm_resource_group.rg-todoApp.location
  server_name         = var.dbservername
  tags = {
    environment = "development"
  }

  timeouts {
    create = "60m"
  }

}