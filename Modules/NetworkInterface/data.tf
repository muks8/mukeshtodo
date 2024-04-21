data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-mukesh"
}

data "azurerm_virtual_network" "vnet-todoApp" {
  name                = "vnet-todoApp-mukesh"
  resource_group_name = "rg-todoApp-mukesh"
}

data "azurerm_subnet" "snet-frontend" {
  name                 = "snet-todoApp-frontend-mukesh"
  virtual_network_name = data.azurerm_virtual_network.vnet-todoApp.name
  resource_group_name  = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_subnet" "snet-backend" {
  name                 = "snet-todoApp-backend-mukesh"
  virtual_network_name = data.azurerm_virtual_network.vnet-todoApp.name
  resource_group_name  = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_network_security_group" "nsg-frontend" {
  name                = "nsg-todoApp-frontend-mukesh"
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_network_security_group" "nsg-backend" {
  name                = "nsg-todoApp-backend-mukesh"
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}
