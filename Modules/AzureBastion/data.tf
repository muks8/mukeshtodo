data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-mukesh"
}

data "azurerm_virtual_network" "vnet-todoApp" {
  name                = "vnet-todoApp-mukesh"
  resource_group_name = "rg-todoApp-mukesh"
}

data "azurerm_subnet" "snet-azurebastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.vnet-todoApp.name
  resource_group_name  = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_public_ip" "pip-azurebastion" {
  name                = "pip-azbas-frontend-mukesh"
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}