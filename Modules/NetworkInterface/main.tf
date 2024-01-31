resource "azurerm_network_interface" "nic-frontend" {
    for_each = var.frontendnicids

  name                = each.value.name
  location            = data.azurerm_resource_group.rg-todoApp.location
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name

  ip_configuration {
    name                          = "internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = data.azurerm_subnet.snet-frontend.id
  }
}

resource "azurerm_network_interface" "nic-backend" {
    for_each = var.backendnicids

  name                = each.value.name
  location            = data.azurerm_resource_group.rg-todoApp.location
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name

  ip_configuration {
    name                          = "internal"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = data.azurerm_subnet.snet-backend.id
  }
}


resource "azurerm_network_interface_security_group_association" "nsg-association-frontent" {
  for_each = var.frontendnicids
  
  network_interface_id      = azurerm_network_interface.nic-frontend[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-frontend.id
}

resource "azurerm_network_interface_security_group_association" "nsg-association-backend" {
  for_each = var.backendnicids
  
  network_interface_id      = azurerm_network_interface.nic-backend[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-backend.id

}