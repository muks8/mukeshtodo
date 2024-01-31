data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-minhaj"
}

data "azurerm_virtual_network" "vnet-todoApp" {
  name                = "vnet-todoApp-minhaj"
  resource_group_name = "rg-todoApp-minhaj"
}

data "azurerm_subnet" "snet-todoApp-frontend" {
  name                 = "snet-todoApp-frontend-minhaj"
  virtual_network_name = data.azurerm_virtual_network.vnet-todoApp.name
  resource_group_name  = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_subnet" "snet-todoApp-backend" {
  name                 = "snet-todoApp-backend-minhaj"
  virtual_network_name = data.azurerm_virtual_network.vnet-todoApp.name
  resource_group_name  = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_network_security_group" "nsg-todoApp-frontend" {
  name                = "nsg-todoApp-frontend-minhaj"
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}


data "azurerm_network_security_group" "nsg-todoApp-backend" {
  name                = "nsg-todoApp-backend-minhaj"
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}
