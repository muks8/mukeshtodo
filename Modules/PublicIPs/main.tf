data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-minhaj"
}

resource "azurerm_public_ip" "todoapp_pipblock" {
  for_each            = var.publicips
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
  location            = data.azurerm_resource_group.rg-todoApp.location
  allocation_method   = each.value.allocation_method
  sku                 = "Standard"

  tags = {
    environment = "development"
  }
}