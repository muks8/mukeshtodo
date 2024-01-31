resource "azurerm_resource_group" "rg-todoApp" {
  name     = var.rg-name
  location = var.rg-location

  tags = {
    environment = "development"
  }
}